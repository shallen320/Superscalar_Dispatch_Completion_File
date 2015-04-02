module completion(
  input clk,
  input [15:0]pc1,
  input [15:0]pc2,
  input [39:0]instbus1,
  input [39:0]instbus2,
  input [39:0]loadbus,
  input [39:0]multbus,
  input [39:0]addbus,
  input [31:0]reg0,
  input [31:0]reg1,
  input [31:0]reg2,
  input [31:0]reg3,
  output reg stall,
  output reg [31:0]reg0_out,
  output reg [31:0]reg1_out,
  output reg [31:0]reg2_out,
  output reg [31:0]reg3_out,
  output exception,
  output reg [39:0]regdata
  );
  
  reg m_state=0;        //main state, 0:normal 1:exception
  reg e_state=0;        //exception state 0: overflow 1: pagefault.
  reg [15:0]pc_que[15:0];     //PC field
  reg [7:0]res_que[15:0];     //reservation station field
  reg [7:0]op_que[15:0];   //opcode field
  reg [7:0]des_que[15:0];   //destine register field
  reg [31:0]data_que[15:0]; //data field
  reg complete[15:0];     //complete bit  1: completed 0: not completed
  reg collected[15:0];   // garbage collected bit  1: collected 0: not collected 
  reg [7:0]srch=8'h10;
//  reg exception[15:0];  //exception bit 0: no exception   1: exception
  
  `include "macros.v"
  
  reg [3:0]index=0;
  reg [3:0]col_pt=0;      //collecting pointer
  reg inst1_flag=0;
  reg inst2_flag=0;
  integer i;
  
  initial begin
    stall=0;
    for(i=0;i<16;i=i+1)begin
      complete[i]=0;
      collected[i]=1;
    end
    wait(clk);
    reg0_out=reg0;
    reg1_out=reg1;
    reg2_out=reg2;
    reg3_out=reg3;
  end
    
  always @ (instbus1) begin
    if(m_state==0)begin
      pc_que[index]=pc1;
      res_que[index]=instbus1[39:32];
      op_que[index]=instbus1[31:24];
      des_que[index]=instbus1[7:0];
      inst1_flag=1;
      collected[index]=0;
    end
  end
  
  always @ (instbus2) begin
    if(m_state==0)begin
      pc_que[index+1]=pc2;
      res_que[index+1]=instbus2[39:32];
      op_que[index+1]=instbus2[31:24];
      des_que[index+1]=instbus2[7:0];
      collected[index+1]=0;
      inst2_flag=1;
    end
  end
  
  always @ (posedge clk)begin
    if (inst1_flag==1)
      if (inst2_flag==1)begin
        index=index+2;
        inst1_flag=0;
        inst2_flag=0;
      end
      else begin
        index=index+1;
        inst1_flag=0;
        inst2_flag=0;
      end
    load_data;
    garbage_collect;
    if(m_state==1 && all_cmplt(index, col_pt))begin
      for(srch=srch;search_reg(srch)==0;srch=srch+1)
      begin
        
      end
      if(srch<`R3+2)
        srch=srch+1;
    end
  end
    
  assign exception=(srch==(`R3+2))?1:0; 
    
  task load_data;
    integer count;
      for(count=1;count<=16;count=count+1)
        if(complete[index-count]==0&&collected[index-count]==0)
          case(res_que[index-count])
            `A0,`A1,`A2:
              if(res_que[index-count]==addbus[39:32])begin
                data_que[index-count]=addbus[31:0];
                res_que[index-count]=0;
                complete[index-count]=1;
                collected[index-count]=0;
                if(data_que[index-count]==32'hffffffff)begin
                  stall=1;
                  m_state=1;
                  e_state=0;
                  index=index-count+1;
                end
                else
                  reg_out(index-count);
              end
            `M0,`M1:
              if(res_que[index-count]==multbus[39:32])begin
                data_que[index-count]=multbus[31:0];
                res_que[index-count]=0;
                complete[index-count]=1;
                collected[index-count]=0;
                if(data_que[index-count]==32'hffffffff)begin
                  stall=1;
                  m_state=1;
                  e_state=0;
                  index=index-count+1;
                end
                else
                  reg_out(index-count);
              end
            `LD0,`LD1:
              if(res_que[index-count]==loadbus[39:32])begin
                if(loadbus[31:0]==32'hffffffff)begin
                  stall=1;
                  m_state=1;
                  e_state=1;
                  index=index-count;
                end
                else begin
                  data_que[index-count]=loadbus[31:0];
                  res_que[index-count]=0;
                  complete[index-count]=1;
                  collected[index-count]=0;
                  reg_out(index-count);
                end
              end
          endcase
  endtask
  
  function all_cmplt;
    input [3:0]func_indx;     //index
    input [3:0]func_pt;     //collection pointer
    reg temp;
    reg [3:0] ip;
    begin
      for (ip=func_indx-1;ip!=col_pt-1;ip=ip-1)
        if(ip==func_indx-1)
          temp=complete[ip];
        else
          temp=temp & complete[ip];
      all_cmplt=temp;
    end
  endfunction
  
  task reg_out;
    input [3:0] task_index;
    case (des_que[task_index])
      `R0:reg0_out=data_que[task_index];
      `R1:reg1_out=data_que[task_index];
      `R2:reg2_out=data_que[task_index];
      `R3:reg3_out=data_que[task_index];
    endcase
  endtask
      
  function [3:0]table_depth;
    input [3:0]func_index;
    if(func_index>=col_pt)
      table_depth=func_index-col_pt;
    else
      table_depth=16+func_index-col_pt;
  endfunction
  
  task garbage_collect;
    if(table_depth(index)>5)begin
      if(complete[col_pt]==1 && collected[col_pt]==0)
        case (des_que[col_pt])
          `R0:begin
            regdata={`R0,data_que[col_pt]};
            collected[col_pt]=1;
            col_pt=col_pt+1;
          end
          `R1:begin
            regdata={`R1,data_que[col_pt]};
            collected[col_pt]=1;
            col_pt=col_pt+1;
          end
          `R2:begin
            regdata={`R2,data_que[col_pt]};
            collected[col_pt]=1;
            col_pt=col_pt+1;
          end
          `R3:begin
            regdata={`R3,data_que[col_pt]};
            collected[col_pt]=1;
            col_pt=col_pt+1;
          end
        endcase
      end
      else
        regdata='hz;
    endtask
          
    
  function search_reg;
    input [7:0]reg_name;
    reg [3:0] count;
    begin
      if(reg_name>=`R0 && reg_name<=`R3)
        for(count=1;(des_que[index-count]!=reg_name||complete[index-count]==0)&&count!=0;count=count+1)
          begin
          end
        if(count==0)
          search_reg=0;     //no data found
        else
          regdata=(reg_name<=`R3)?{reg_name, data_que[index-count]}:'hz;          
          search_reg=1;
    end
  endfunction
  
endmodule

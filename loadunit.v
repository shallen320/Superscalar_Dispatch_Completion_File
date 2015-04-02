module loadunit(
  input clk,
  input [31:0]data_in,
  input [7:0]ST0_t,
  input [7:0]ST1_t,
  input [15:0]ST0_addr,
  input [15:0]ST1_addr,
  input [39:0]instbus1,
  input [39:0]instbus2,
  input [39:0]addbus,
  input [39:0]multbus,
  input [39:0]loadbus,
  output [39:0]loadout
  );
  
  reg [31:0] LD0;
  reg [31:0] LD1;
  reg new_inst1=0;
  reg new_inst2=0;
  reg [7:0] LD0_t;
  reg [7:0] LD1_t;
  reg [15:0] LD0_addr;
  reg [15:0] LD1_addr;
  reg [1:0] LD0_count;
  reg [1:0] LD1_count;
  reg LD0_rdy;
  reg LD1_rdy;
  
  `include "macros.v"
  
  initial begin
    LD0_count<=2;
    LD1_count<=2;
  end
  
  always @ (instbus1)begin
    if(instbus1[31:24]==`LOAD)begin
      new_inst1<=1;
      case (instbus1[39:32])
        `LD0:begin
          LD0_addr<=instbus1[23:8];
        end
        `LD1:begin
          LD1_addr<=instbus1[23:8];
        end
      endcase
    end
  end
      
  always @ (instbus2)begin
    if(instbus2[31:24]==`LOAD || instbus2[31:24]==`STORE)begin
      new_inst2<=1;
      if(instbus2[31:24]==`LOAD)
        case (instbus2[39:32])
          `LD0:begin
            LD0_addr<=instbus2[23:8];
          end
          `LD1:begin
            LD1_addr<=instbus2[23:8];
          end
        endcase
    end
  end
  
  always @ (posedge clk)begin
    if(instbus1[31:24]==`LOAD && instbus2[31:24]==`STORE 
      && instbus1[23:8]==instbus2[23:8] && new_inst1==1 && new_inst2==1)begin
      new_inst1<=0;
      new_inst2<=0;
      case (instbus2[7:0])
        `ST0:
          case (instbus1[39:32])
            `LD0: 
              if(LD0_addr==ST1_addr)
                LD0_t<=ST1_t;
              else begin
                LD0_t<=15;  
                LD0_rdy<=1;
              end      
            `LD1:
              if(LD1_addr==ST1_addr)
                LD1_t<=ST1_t;
              else begin
                LD1_t<=15;  
                LD1_rdy<=1;
              end
          endcase
        `ST1:
          case (instbus1[39:32])
            `LD0: 
              if(LD0_addr==ST0_addr)
                LD0_t<=ST0_t;
              else begin
                LD0_t<=15;  
                LD0_rdy<=1;
              end      
            `LD1:
              if(LD1_addr==ST0_addr)
                LD1_t<=ST0_t;
              else begin
                LD1_t<=15;  
                LD1_rdy<=1;
              end
          endcase
      endcase
    end
    else begin
      if(instbus1[31:24]==`LOAD && new_inst1==1)begin
        new_inst1<=0;
        addr_cmpr(instbus1);
      end
      if(instbus2[31:24]==`LOAD && new_inst2==1)begin
        new_inst2<=0;
        addr_cmpr(instbus2);
      end
      new_inst1<=0;
      new_inst2<=0;
    end
  end
  
  task addr_cmpr;    //address compare
    input [39:0]instbus;
    case (instbus[39:32])
      `LD0:begin
        if(LD0_addr==ST0_addr)
          LD0_t<=ST0_t;
        else if(LD0_addr==ST1_addr)
          LD0_t<=ST1_t;
        else begin
          LD0_t<=15;  
          LD0_rdy<=1;
        end
      end
      `LD1:begin
        if(LD1_addr==ST0_addr)
          LD1_t<=ST0_t;
        else if(LD1_addr==ST1_addr)
          LD1_t<=ST1_t;
        else begin
          LD1_t<=15; 
          LD1_rdy<=1;
        end
      end
    endcase
  endtask
  
  always @ (posedge clk)begin
    if (LD0_t==addbus[39:32])begin
      LD0<=addbus[31:0];
      LD0_t<=0;
      LD0_count<=0;
    end
    else if (LD0_t==multbus[39:32])begin
      LD0<=multbus[31:0];
      LD0_t<=0;
      LD0_count<=0;
    end
    else if (LD0_t==loadbus[39:32])begin
      LD0<=loadbus[31:0];
      LD0_t<=0;
      LD0_count<=0;
    end
      
    if (LD1_t==addbus[39:32])begin
      LD1<=addbus[31:0];
      LD1_t<=0;
      LD1_count<=0;
    end
    else if (LD1_t==multbus[39:32])begin
      LD1<=multbus[31:0];
      LD1_t<=0;
      LD1_count<=0;
    end
    else if (LD1_t==loadbus[39:32])begin
      LD1<=loadbus[31:0];
      LD1_t<=0;
      LD1_count<=0;
    end
  end
  
  always @ (negedge clk)begin
    if (LD0_count==0 && LD1_count==0)
      LD0_count<=1;
    else begin
      if (LD0_count!=2)
        LD0_count<=LD0_count+1;
      if (LD1_count!=2)
        LD1_count<=LD1_count+1;
    end
      
    if(LD0_rdy==1)begin
      LD0_count<=0;
      LD0_rdy<=0;
    end
    else if(LD1_rdy==1)begin
      LD1_count<=0;
      LD1_rdy<=0;
    end
  end  
  
  assign loadout = (LD0_count==1)?{`LD0,LD0_t==15?data_in:LD0}:((LD1_count==1)?{`LD1,LD1_t==15?data_in:LD1}:40'hz);
endmodule

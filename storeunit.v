module storeunit(
  input clk,
  output [31:0]data_out,
  output [7:0]storesig,
  output reg [7:0] ST0_t,
  output reg [7:0] ST1_t,
  output reg [15:0] ST0_addr,
  output reg [15:0] ST1_addr,
  input [31:0]reg0,
  input [31:0]reg1,
  input [31:0]reg2,
  input [31:0]reg3,
  input [39:0]instbus1,
  input [39:0]instbus2,
  input [39:0]addbus,
  input [39:0]multbus,
  input [39:0]loadbus
  );
  
  reg [31:0] ST0;
  reg [31:0] ST1;
  reg [1:0] ST0_count;
  reg [1:0] ST1_count;
  reg ST0_rdy;
  reg ST1_rdy;
  
  `include "macros.v"
  
  initial begin
    ST0_addr<=0;
    ST1_addr<=0;
    ST0_count<=2;
    ST1_count<=2;
  end
  
  always @ (instbus1) begin
    case (instbus1[7:0])
      `ST0:begin
        case (instbus1[39:32])
          `R0:begin
            ST0<=reg0;
            ST0_rdy<=1;
          end
          `R1:begin
            ST0<=reg1;
            ST0_rdy<=1;
          end
          `R2:begin
            ST0<=reg2;
            ST0_rdy<=1;
          end
          `R3:begin
            ST0<=reg3;
            ST0_rdy<=1;
          end
          default:
            ST0_t<=instbus1[39:32];
        endcase
        ST0_addr<=instbus1[23:8];
      end
      `ST1:begin
        case (instbus1[39:32])
          `R0:begin
            ST1<=reg0;
            ST1_rdy<=1;
          end
          `R1:begin
            ST1<=reg1;
            ST1_rdy<=1;
          end
          `R2:begin
            ST1<=reg2;
            ST1_rdy<=1;
          end
          `R3:begin
            ST1<=reg3;
            ST1_rdy<=1;
          end
          default:
            ST1_t<=instbus1[39:32];
        endcase
        ST1_addr<=instbus1[23:8];
      end
    endcase
  end
  
  always @ (instbus2) begin
    case (instbus2[7:0])
      `ST0:begin
        case (instbus2[39:32])
          `R0:begin
            ST0<=reg0;
            ST0_rdy<=1;
          end
          `R1:begin
            ST0<=reg1;
            ST0_rdy<=1;
          end
          `R2:begin
            ST0<=reg2;
            ST0_rdy<=1;
          end
          `R3:begin
            ST0<=reg3;
            ST0_rdy<=1;
          end
          default:
            ST0_t<=instbus2[39:32];
        endcase
        ST0_addr<=instbus2[23:8];
      end
      `ST1:begin
        case (instbus2[39:32])
          `R0:begin
            ST1<=reg0;
            ST1_rdy<=1;
          end
          `R1:begin
            ST1<=reg1;
            ST1_rdy<=1;
          end
          `R2:begin
            ST1<=reg2;
            ST1_rdy<=1;
          end
          `R3:begin
            ST1<=reg3;
            ST1_rdy<=1;
          end
          default:
            ST1_t<=instbus2[39:32];
        endcase
        ST1_addr<=instbus2[23:8];
      end
    endcase
  end
  
  always @ (posedge clk) begin
    if (ST0_t==addbus[39:32])begin
      ST0<=addbus[31:0];
      ST0_t<=0;
      ST0_rdy<=1;
    end
    else if (ST0_t==multbus[39:32])begin
      ST0<=multbus[31:0];
      ST0_t<=0;
      ST0_rdy<=1;
    end
    else if (ST0_t==loadbus[39:32])begin
      ST0<=loadbus[31:0];
      ST0_t<=0;
      ST0_rdy<=1;
    end
      
    if (ST1_t==addbus[39:32])begin
      ST1<=addbus[31:0];
      ST1_t<=0;
      ST1_rdy<=1;
    end
    else if (ST1_t==multbus[39:32])begin
      ST1<=multbus[31:0];
      ST1_t<=0;
      ST1_rdy<=1;
    end
    else if (ST1_t==loadbus[39:32])begin
      ST1<=loadbus[31:0];
      ST1_t<=0;
      ST1_rdy<=1;
    end
  end
  
  always @ (negedge clk)begin
    if (ST0_count!=2)
      ST0_count<=ST0_count+1;
    if (ST1_count!=2)
      ST1_count<=ST1_count+1;
      
    if(ST0_rdy==1)begin
      ST0_count<=0;
      ST0_rdy<=0;
    end
    else if(ST1_rdy==1)begin
      ST1_count<=0;
      ST1_rdy<=0;
    end
  end
  
  assign data_out = (ST0_count==1)?ST0:((ST1_count==1)?ST1:32'hz); 
  assign storesig = (ST0_count==1)?`ST0:((ST1_count==1)?`ST1:8'hz); 
endmodule

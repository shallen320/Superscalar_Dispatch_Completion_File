module register(
  input clk,
  input [39:0]data_in,
  output reg [31:0]reg0,
  output reg [31:0]reg1,
  output reg [31:0]reg2,
  output reg [31:0]reg3
  );
  
  `include "macros.v"
  
  always @(negedge clk)
    case (data_in[39:32])
      `R0:reg0<=data_in[31:0];
      `R1:reg1<=data_in[31:0];
      `R2:reg2<=data_in[31:0];
      `R3:reg3<=data_in[31:0];
    endcase
      
endmodule

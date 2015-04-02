module instque(
  input clk,
  input stall1,
  input stall2,
  output reg [15:0]pc1,
  output reg [15:0]pc2,
  output reg [31:0]inst1,
  output reg [31:0]inst2
  );
  
  reg [31:0]queue[255:0];
  reg [15:0]pc_que[255:0];
  reg [7:0] index=0;
  
  initial begin
    $readmemh("instruction",queue);
    $readmemh("pcaddr",pc_que);
  end
  
  always @ (posedge clk)
    if(stall1==0)begin
      inst1=queue[index];
      pc1=pc_que[index];
      if(stall2==0)begin
        inst2=queue[index+1];
        pc2=pc_que[index+1];
        index=index+2;
      end
      else begin
        inst1=queue[index-1];
        pc1=pc_que[index-1];
        inst2=queue[index];
        pc2=pc_que[index];
        index=index+1;
      end
    end
    
endmodule
  

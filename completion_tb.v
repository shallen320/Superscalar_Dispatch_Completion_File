module complete_tb;
  reg clk;
  reg [15:0]pc1;
  reg [15:0]pc2;
  reg [39:0]instbus1;
  reg [39:0]instbus2;
  reg [39:0]loadbus;
  reg [39:0]multbus;
  reg [39:0]addbus;
  reg [31:0]reg0;
  reg [31:0]reg1;
  reg [31:0]reg2;
  reg [31:0]reg3;
  wire stall;
  wire [31:0]reg0_out;
  wire [31:0]reg1_out;
  wire [31:0]reg2_out;
  wire [31:0]reg3_out;
  wire exception;
  wire [39:0]regdata;
  
  completion COM (
    .clk(clk),
    .pc1(pc1),
    .pc2(pc2),
    .instbus1(instbus1),
    .instbus2(instbus2),
    .loadbus(loadbus),
    .multbus(multbus),
    .addbus(addbus),
    .reg0(reg0),
    .reg1(reg1),
    .reg2(reg2),
    .reg3(reg3),
    .stall(stall),
    .reg0_out(reg0_out),
    .reg1_out(reg1_out),
    .reg2_out(reg2_out),
    .reg3_out(reg3_out),
    .exception(exception),
    .regdata(regdata)
  );
  
  //instructions
  initial begin
    clk=0;
    pc1=16'h0012;
    pc2=16'h0022;
    instbus1=40'h4001123411;
    instbus2=40'h3004401211;
    #10 instbus1=40'h2003301213;  pc1=16'h0023;
    #10 instbus1=40'h2103302011;  pc1=16'h0024;
        instbus2=40'h2203201012;  pc2=16'h0025;
    #10 instbus1=40'h2102302050;  pc1=16'h0026;
        instbus2=40'h3104212012;  pc2=16'h0027;
    #10 instbus1=40'h4101342110;  pc1=16'h0028;
  end
  
  
  //data 
  initial begin
    //normal
/*    #40 loadbus=40'h4023232323;
    #10 loadbus='hz;multbus=40'h30000006e8;
    #10 multbus='hz;addbus=40'h2000004523;
    #10 addbus=40'h2100001223;
    #10 addbus=40'h22000a2b23;
    #10 addbus='hz;multbus=40'h3100001bda;
    #10 multbus='hz;*/
    // overflow
/*  #40 loadbus=40'h4023232323;
    #10 loadbus='hz;multbus=40'h30000006e8;
    #10 multbus='hz;
    #10 addbus='hz; multbus=40'h31ffffffff;
    #10 multbus='hz; addbus=40'h2000004523;
    #10 addbus=40'h2100001223;
    #10 addbus=40'h22000a2b23;
    #10 addbus='hz;     */
    // page fault
    #40 loadbus=40'h4023232323;
    #10 loadbus='hz;multbus=40'h30000006e8;
    #10 multbus='hz;
    #10 loadbus=40'h41ffffffff;
    #10 loadbus='hz;
    #10 addbus='hz; multbus=40'h3123454abc;
    #10 multbus='hz; addbus=40'h2000004523;
    #10 addbus=40'h2100001223;
    #10 addbus=40'h22000a2b23;
    #10 addbus='hz;
  end
  
  always
    #5 clk=~clk;
    
endmodule
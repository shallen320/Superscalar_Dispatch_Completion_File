module loadstore_tb;
  reg clk;
  reg [31:0]data_in;
  wire [7:0]ST0_t;
  wire [7:0]ST1_t;
  wire [15:0]ST0_addr;
  wire [15:0]ST1_addr;
  reg [39:0]instbus1;
  reg [39:0]instbus2;
  reg [39:0]addbus;
  reg [39:0]multbus;
  reg [39:0]loadbus;
  wire [39:0]loadout;
  wire [31:0]data_out;
  wire [7:0]storesig;
  reg [31:0]reg0;
  reg [31:0]reg1;
  reg [31:0]reg2;
  reg [31:0]reg3;

  storeunit ST (
    .clk(clk),
    .data_out(data_out),
    .storesig(storesig),
    .ST0_t(ST0_t),
    .ST1_t(ST1_t),
    .ST0_addr(ST0_addr),
    .ST1_addr(ST1_addr),
    .reg0(reg0),
    .reg1(reg1),
    .reg2(reg2),
    .reg3(reg3),
    .instbus1(instbus1),
    .instbus2(instbus2),
    .addbus(addbus),
    .multbus(multbus),
    .loadbus(loadbus)
  );
  
  `include "macros.v"
  
  loadunit LD (
    .clk(clk),
    .data_in(data_in),
    .ST0_t(ST0_t),
    .ST1_t(ST1_t),
    .ST0_addr(ST0_addr),
    .ST1_addr(ST1_addr),
    .instbus1(instbus1),
    .instbus2(instbus2),
    .addbus(addbus),
    .multbus(multbus),
    .loadbus(loadbus),
    .loadout(loadout)
  );
  //instructions
  initial begin
    clk=0;
    data_in=32'h2b2b2b2b;
    instbus1={`LD0,`LOAD,16'h2323,`R0};
    instbus2={`A2,`STORE,16'h2323,`ST0};
    #10 instbus1={`M0,`STORE,16'h1414,`ST1};
        instbus2={`LD1,`LOAD,16'h1414,`R2};
    #20 instbus1={`LD0,`LOAD,16'habcd,`R1}; data_in=32'h0098cdcd;
    #30 instbus1={`A1,`STORE,16'h3478,`ST0};
  end
  
  //data
  initial begin
    #30 addbus={`A2,32'h12345678};
    #10 addbus='hz; multbus={`M0,32'h00004567};
    #10 multbus='hz;
    #50 addbus={`A1,32'h00870012};
    #10 addbus='hz;
  end
  
  always
    #5 clk=~clk;
    
endmodule

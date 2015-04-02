module top_tb;
  reg clk;
  wire stall1;
  wire stall1_cmp;
  wire stall1_dspt;
  wire stall2;
  wire [39:0] data_clct;
  reg [31:0]data_in;
  wire [15:0]pc1;
  wire [15:0]pc2;
  wire [7:0]storesig;
  wire [31:0]data_out;
  wire [31:0]inst1;
  wire [31:0]inst2;
  wire [39:0]instbus1;
  wire [39:0]instbus2;
  wire [39:0]multbus;
  wire [39:0]loadbus;
  wire [39:0]addbus;
  wire [31:0]reg0;
  wire [31:0]reg1;
  wire [31:0]reg2;
  wire [31:0]reg3;
  wire [31:0]reg0_cmp;
  wire [31:0]reg1_cmp;
  wire [31:0]reg2_cmp;
  wire [31:0]reg3_cmp;
  wire [7:0]ST0_t;
  wire [7:0]ST1_t;
  wire [15:0]ST0_addr;
  wire [15:0]ST1_addr;
  wire exception;
  
  or (stall1, stall1_cmp, stall1_dspt);
  instque INST (clk, stall1, stall2, pc1, pc2, inst1, inst2);
  dispatch DSPT (clk, inst1, inst2, addbus, multbus, loadbus, storesig, 
              instbus1, instbus2, stall1_dspt, stall2);
  register REG (clk, data_clct, reg0_cmp, reg1_cmp, reg2_cmp, reg3_cmp);
  loadunit LDUT (clk, data_in, ST0_t, ST1_t, ST0_addr, ST1_addr, 
                  instbus1, instbus2, addbus, multbus,loadbus, loadbus);
  storeunit STUT (clk, data_out, storesig, ST0_t, ST1_t, ST0_addr, ST1_addr,
               reg0, reg1, reg2, reg3, 
            instbus1,instbus2, addbus, multbus, loadbus);
  adder ADD (clk, reg0, reg1, reg2, reg3, loadbus, multbus, addbus, instbus1,
             instbus2, addbus);
  multi MUL (clk, reg0, reg1, reg2, reg3, loadbus, multbus, addbus, instbus1,
            instbus2, multbus);
  completion COM (clk, pc1, pc2, instbus1, instbus2, loadbus, multbus, addbus,
          reg0_cmp, reg1_cmp, reg2_cmp, reg3_cmp, stall1_cmp, reg0, reg1, reg2,
          reg3, exception, data_clct);
  
  initial begin
    clk=0;
    //  garbage collect
    /*
    REG.reg2=23'h34;
    REG.reg0=23'h57;
    data_in=32'h00000022;
    */
    
    //  adder overflow
    /*
    data_in=1;
    #40 data_in=32'hcccccccc;*/
    // page fault 
    data_in='h23;
    #40 data_in=32'h56;
    #20 data_in=32'hffffffff;
    /* RAW  */
    /*
    REG.reg2=32'h34;
    data_in=32'h45;
    */
  end
  
  always
    #5 clk=~clk;
    
endmodule
    
  
module top;
  
  bit clk;
  bit reset;

  initial begin 
    reset = 1'b1;
    reset = 1'b0;
  end

  always #10 clk = ~clk;


  alu_io alu_io12 ( clk ) ;


  oc8051_alu DUT (
    .clk(alu_io12.clk),
    .rst(alu_io12.rst),
    .bit_in(alu_io12.bit_in),
    .srcAc(alu_io12.srcAc),
    .srcCy(alu_io12.srcCy),
    .desCy(alu_io12.desCy),
    .desAc(alu_io12.desAc),
    .desOv(alu_io12.desOv) ,
    .src1(alu_io12.src1),
    .src2(alu_io12.src2),
    .src3(alu_io12.src3),
    .des1(alu_io12.des1),
    .des2(alu_io12.des2),
    .des_acc(alu_io12.des_acc),
    .sub_result(alu_io12.sub_result) ,
    .op_code(alu_io12.op_code) 
  );


  initial begin

    uvm_config_db #(virtual alu_io)::set(null, "*", "alu_io", alu_io12);
    run_test("test");

  end

  initial begin
   $dumpfile("dump.vcd");
   $dumpvars;
   
    
  end

endmodule

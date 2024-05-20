`include "oc8051_divide.v"
`include "oc8051_multiply.v"
/*`include "oc8051_defines.v"

*/

  import uvm_pkg::*;
`include "uvm_macros.svh"




`include "input_agent.sv"
`include "env.sv"

`include "test.sv"
`include "alu_io.sv"

`include "top.sv"
/*
`include "uvm_macros.svh"
import uvm_pkg::*;


module top;

  bit clk;
  bit reset;

  initial begin 
    reset = 1'b1;
    reset = 1'b0;
  end

  always #10 clk = ~clk;


  alu_io alu_io1(clk, reset);

  oc8051_alu DUT (
    .clk(alu_io1.clk),
    .rst(alu_io1.rst),
    .bit_in(alu_io1.bit_in),
    .srcAc(alu_io1.srcAc),
    .srcCy(alu_io1.srcCy),
    .desCy(alu_io1.desCy),
    .desAc(alu_io1.desAc),
    .desOv(alu_io1.desOv) ,
    .src1(alu_io1.src1),
    .src2(alu_io1.src2),
    .src3(alu_io1.src3),
    .des1(alu_io1.des1),
    .des2(alu_io1.des2),
    .des_acc(alu_io1.des_acc),
    .sub_result(alu_io1.sub_result) ,
    .op_code(alu_io1.op_code) 
  );




  initial begin

    uvm_config_db #(virtual alu_io)::set(null, "*", "alu_io", alu_io1);
    run_test("test");

  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

  end

endmodule
*/

class alu_seq_item extends uvm_sequence_item;
  
  
  `uvm_object_utils(alu_seq_item)
  rand bit[7:0] src1, src2, src3 ;
  bit [7:0] des1, des2, des_acc, sub_result;
  bit desCy, desAc, desOv;
  rand bit srcCy, srcAc, bit_in;
  rand bit [3:0] op_code;
  bit rst;


  function new (string name = "alu_seq_item");
    super.new(name);
  endfunction: new
  
 
endclass
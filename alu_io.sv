interface alu_io #(parameter
    ADDR_WIDTH           = 3,
    DATA_WIDTH           = 32,
    fifo_size                   =2**ADDR_WIDTH
  )(input clk);
    bit rst;
    bit bit_in;
    bit srcAc;
  	bit srcCy;
    bit desCy;
 	bit desAc;
    bit desOv;
  logic [7:0] src1;
  logic [7:0] src2;
  logic [7:0] src3;
  logic [7:0] des1;
  logic [7:0] des2;
  logic [7:0] des_acc;
  logic [7:0] sub_result;
  logic [3:0] op_code;
  
  clocking cb @(posedge clk);
    
    default input #1ns output #2ns;
    
    input bit_in, srcAc, srcCy , op_code ;
    input desCy, desAc, desOv ;
    input src1, src2, src3 ;
  	input des1, des2, des_acc ;
  	input sub_result ;
    
  endclocking
  
    clocking drv @(posedge clk);
    
    default input #1ns output #2ns;
    
    output bit_in, srcAc, srcCy , op_code ;
    input desCy, desAc, desOv ;
    output src1, src2, src3 ;
  	input des1, des2, des_acc ;
  	input sub_result ;
    
  endclocking
  
  
  modport TB  (clocking cb, input clk , rst);
  
    modport dv  (clocking drv, input clk , output rst );
      
    //modport monitor  (clocking cb, rst);
        
endinterface

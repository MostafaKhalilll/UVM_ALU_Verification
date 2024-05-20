class coverage extends uvm_subscriber #(alu_seq_item);
   `uvm_component_utils(coverage)

  uvm_analysis_imp #(alu_seq_item, coverage) monitor_cov ;

  alu_seq_item seq_trans;
  
  bit desCy;
 	bit desAc;
    bit desOv;
    logic [7:0] src1;
  	logic [7:0] src2;
  	logic [7:0] src3;
  logic [3:0] op_code;

    
  function new (string name,uvm_component parent);
    super.new(name, parent);
     cov  = new();
  endfunction  
  
   covergroup cov;

     op_code : coverpoint     seq_trans.op_code;
     desCy : coverpoint     seq_trans.desCy;
     desAc : coverpoint     seq_trans.desAc;
     desOv : coverpoint     seq_trans.desOv;
     
      endgroup : cov
  
    virtual function void build_phase (uvm_phase phase);
    super.build_phase (phase);
    /// instance analysis port
      seq_trans = new();
      monitor_cov = new ("monitor_cov", this);  
         

  endfunction
  
  virtual function void write(alu_seq_item t);
         
     seq_trans.desCy = t.desCy;
     seq_trans.desAc = t.desAc;
     seq_trans.desOv = t.desOv;
     seq_trans.src1 = t.src1;
     seq_trans.src2 = t.src2;
     seq_trans.src3 = t.src3;
     seq_trans.op_code = t.op_code;
     cov.sample();

     
   endfunction : write
  
    function void report_phase(uvm_phase phase);
      `uvm_info(get_full_name(),$sformatf("Coverage is %0.2f %% ", cov.get_coverage()),UVM_LOW);
  endfunction

endclass : coverage
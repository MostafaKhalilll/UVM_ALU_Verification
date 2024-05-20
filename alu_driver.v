`define DRIV vif.Driver.driver_cb

class alu_driver extends uvm_driver #(alu_seq_item);

  virtual alu_io alu_io1; 

  `uvm_component_utils(alu_driver);

  function new(string name,uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task run_phase (uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive();
      seq_item_port.item_done();
    end
  endtask: run_phase


  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (! uvm_config_db #(virtual alu_io) ::get(this, "", "alu_io", alu_io1)) begin

      `uvm_error (get_type_name (), "DUT interface not found")

    end

  endfunction:build_phase


  virtual task drive();

    @(posedge alu_io1.dv.clk);

    alu_io1.drv.op_code <= req.op_code;     

    alu_io1.drv.bit_in <= req.bit_in;
    alu_io1.drv.srcCy <= req.srcCy;
    alu_io1.drv.srcAc <= req.srcAc;
    alu_io1.drv.src1 <= req.src1;
    alu_io1.drv.src2 <= req.src2;
    alu_io1.drv.src3 <= req.src3;

    @(posedge alu_io1.dv.clk);
    ///add delay

    `uvm_info(get_type_name(), $sformatf("---- driver data ---"),UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("op code : %0d",req.op_code ),UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("in1 : %0d",req.src1 ),UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("in2 : %0d",req.src2 ),UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("in3 : %0d",req.src3 ),UVM_LOW)
    
    
  endtask :drive




endclass
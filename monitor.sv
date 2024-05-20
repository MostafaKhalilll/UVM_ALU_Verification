class monitor extends uvm_monitor;

  `uvm_component_utils (monitor)
  /////Instantiation my_data is a custom class object LTM

  virtual alu_io alu_io1;
  alu_seq_item mon_tran;

  ///uvm_analysis_port #(my_data) mon_analysis_port;

  /// port to connect with coverage :

  uvm_analysis_port #(alu_seq_item) mon_analysis_port;

  ////Standard Code for all Components.
  function new (string name, uvm_component parent = null);
    super.new(name, parent);
    mon_tran = new();
  endfunction
  // build phase

  virtual function void build_phase (uvm_phase phase);
    super.build_phase (phase);
    mon_analysis_port = new ("mon_analysis_port", this);

    if (!uvm_config_db #(virtual alu_io) ::get(this, "*", "alu_io", alu_io1)) begin

      `uvm_error (get_type_name (), "DUT interface not found")

    end

  endfunction

  // Run Phase

  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge alu_io1.TB.clk); //clocking block of interface

      //add input/output delay
      mon_tran.op_code 		= alu_io1.cb.op_code;
      mon_tran.bit_in			= alu_io1.cb.bit_in;
      mon_tran.srcAc 			= alu_io1.cb.srcAc;
      mon_tran.srcCy 			= alu_io1.cb.srcCy;
      mon_tran.src1 			= alu_io1.cb.src1;
      mon_tran.src2			= alu_io1.cb.src2;
      mon_tran.src3			= alu_io1.cb.src3;
//output
      @(posedge alu_io1.TB.clk);
      mon_tran.desCy 			= alu_io1.cb.desCy;
      mon_tran.desAc 			= alu_io1.cb.desAc;
      mon_tran.desOv 			= alu_io1.cb.desOv;
      mon_tran.des1 			= alu_io1.cb.des1;
      mon_tran.des2 			= alu_io1.cb.des2;
      mon_tran.des_acc		= alu_io1.cb.des_acc;
      mon_tran.sub_result		= alu_io1.cb.sub_result;

      `uvm_info(get_type_name(), $sformatf("---- monitor data ---"),UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("op code : %0d", mon_tran.op_code ),UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("in1 : %0d", mon_tran.src1 ),UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("in2 : %0d",mon_tran.src2 ),UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("in3 : %0d",mon_tran.src3 ),UVM_LOW)
     // `uvm_info(get_type_name(), $sformatf("bit_in : %0d", mon_tran.bit_in ),UVM_LOW)
     // `uvm_info(get_type_name(), $sformatf("srcAc : %0d", mon_tran.srcAc  ),UVM_LOW)
     // `uvm_info(get_type_name(), $sformatf("srcCy : %0d",mon_tran.srcCy ),UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("desCy : %0d",mon_tran.desCy  ),UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("desAc : %0d",mon_tran.desAc ),UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("desOv : %0d",mon_tran.desOv ),UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("des1 : %0d",mon_tran.des1 ),UVM_LOW)
      `uvm_info(get_type_name(), $sformatf("des2 : %0d",mon_tran.des2 ),UVM_LOW)
   //   `uvm_info(get_type_name(), $sformatf("des_acc : %0d", mon_tran.des_acc  ),UVM_LOW)
      //`uvm_info(get_type_name(), $sformatf("sub_result : %0d",mon_tran.sub_result ),UVM_LOW)

      mon_analysis_port.write(mon_tran);

    end

  endtask : run_phase



endclass
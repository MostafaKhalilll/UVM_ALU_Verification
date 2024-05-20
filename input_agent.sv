`include "seq_item.sv"
`include "sequencer.sv"
`include "sequence.sv"
`include "alu_driver.sv"
`include "monitor.sv"


class input_agent extends uvm_agent ;
  `uvm_component_utils(input_agent)
  
   
  alu_driver driver;
  sequencer seqr;
  monitor monitor1;

  typedef uvm_sequencer#(alu_seq_item) my_sequencer;
 
  function new(string name = "alu_agent", uvm_component parent);
    super.new(name,parent);
  endfunction : new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(get_is_active() == UVM_ACTIVE) begin
      driver = alu_driver::type_id::create("driver",this);
      seqr = sequencer::type_id::create("sequencer",this);
    end
    monitor1 = monitor::type_id::create("monitor",this);
  endfunction : build_phase
  
  function void connect_phase(uvm_phase phase);
     if(get_is_active() == UVM_ACTIVE) begin
    driver.seq_item_port.connect(seqr.seq_item_export);
     end
  endfunction : connect_phase
  
endclass : input_agent
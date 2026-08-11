class pwm_driver extends uvm_driver #(pwm_transaction);

  `uvm_component_utils(pwm_driver)

  virtual pwm_if vif;

  function new(string name = "pwm_driver", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db#(virtual pwm_if)::get(this,"","vif",vif))
      `uvm_fatal("NOVIF","Virtual Interface not found")
  endfunction

  task run_phase(uvm_phase phase);

    pwm_transaction req;

    forever begin

        seq_item_port.get_next_item(req);

        @(negedge vif.clk);
        vif.Dutycycle = req.Dutycycle;

        // Hold for one PWM period
        repeat (100)
            @(posedge vif.clk);

        seq_item_port.item_done();

    end

endtask
endclass

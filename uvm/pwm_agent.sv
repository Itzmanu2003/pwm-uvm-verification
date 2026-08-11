class pwm_agent extends uvm_agent;

    `uvm_component_utils(pwm_agent)

    pwm_driver    driver;
    pwm_monitor   monitor;
    pwm_sequencer sequencer;

    function new(string name = "pwm_agent",
                 uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        driver    = pwm_driver   ::type_id::create("driver", this);
        monitor   = pwm_monitor  ::type_id::create("monitor", this);
        sequencer = pwm_sequencer::type_id::create("sequencer", this);

    endfunction

    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);

        driver.seq_item_port.connect(sequencer.seq_item_export);

    endfunction

endclass

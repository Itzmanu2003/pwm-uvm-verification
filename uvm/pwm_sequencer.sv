class pwm_sequencer extends uvm_sequencer #(pwm_transaction);

    `uvm_component_utils(pwm_sequencer)

    function new(string name = "pwm_sequencer",
                 uvm_component parent);
        super.new(name, parent);
    endfunction

endclass

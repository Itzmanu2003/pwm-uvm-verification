class pwm_coverage extends uvm_subscriber #(pwm_transaction);

    `uvm_component_utils(pwm_coverage)

    pwm_transaction tr;

    covergroup pwm_cg;

    // Duty cycle coverage
    duty_cp : coverpoint tr.Dutycycle {

        // 100 value bins
        bins duty[] = {[0:99]};

        // Transition coverage
        bins inc = ([0:98] => [1:99]);
        bins dec = ([1:99] => [0:98]);

    }

    // PWM output coverage
    pwm_cp : coverpoint tr.pwmout {
        bins low  = {0};
        bins high = {1};
    }

endgroup

    function new(string name = "pwm_coverage",uvm_component parent);
        super.new(name, parent);

     pwm_cg = new();
    endfunction

    function void write(pwm_transaction t);

        tr = t;

        pwm_cg.sample();

    endfunction
    
    function void report_phase(uvm_phase phase);
    super.report_phase(phase);

    `uvm_info("COVERAGE",$sformatf("Functional Coverage = %0.2f%%",pwm_cg.get_coverage()),UVM_LOW)
endfunction

endclass

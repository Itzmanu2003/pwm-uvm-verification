class pwm_transition_sequence extends uvm_sequence #(pwm_transaction);

    `uvm_object_utils(pwm_transition_sequence)

    pwm_transaction req;

    function new(string name = "pwm_transition_sequence");
        super.new(name);
    endfunction

    task body();

    for(int i=0;i<=99;i++) begin
    	`uvm_info("TRANS_SEQ", $sformatf("Duty = %0d", i), UVM_LOW)

        req = pwm_transaction::type_id::create("req");

        start_item(req);
        req.Dutycycle = i;
        finish_item(req);

    end

endtask

endclass

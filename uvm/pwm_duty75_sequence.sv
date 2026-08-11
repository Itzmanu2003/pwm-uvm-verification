class pwm_duty75_sequence extends uvm_sequence #(pwm_transaction);

    `uvm_object_utils(pwm_duty75_sequence)

    pwm_transaction req;

    function new(string name = "pwm_duty75_sequence");
        super.new(name);
    endfunction

    task body();

        req = pwm_transaction::type_id::create("req");

        start_item(req);
        req.Dutycycle = 75;
        finish_item(req);

    endtask

endclass

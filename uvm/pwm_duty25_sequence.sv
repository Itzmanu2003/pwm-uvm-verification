class pwm_duty25_sequence extends uvm_sequence #(pwm_transaction);

    `uvm_object_utils(pwm_duty25_sequence)

    pwm_transaction req;

    function new(string name = "pwm_duty25_sequence");
        super.new(name);
    endfunction

    task body();

        req = pwm_transaction::type_id::create("req");

        start_item(req);
        req.Dutycycle = 25;
        finish_item(req);

    endtask

endclass

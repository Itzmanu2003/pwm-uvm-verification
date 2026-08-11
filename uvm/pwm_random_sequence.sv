class pwm_random_sequence extends uvm_sequence #(pwm_transaction);

    `uvm_object_utils(pwm_random_sequence)

    pwm_transaction req;

    function new(string name = "pwm_random_sequence");
        super.new(name);
    endfunction
task body();

    repeat(5000) begin

        req = pwm_transaction::type_id::create("req");

        start_item(req);

        assert(req.randomize());

        finish_item(req);

    end

endtask

endclass

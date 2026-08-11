/*class pwm_transaction extends uvm_sequence_item;

    
    rand bit [7:0] Dutycycle;

  
    bit [7:0] counter;
    bit pwmout;

   
    constraint duty_c {
        Dutycycle inside {[0:99]};
    }

 
    `uvm_object_utils(pwm_transaction)

   
    function new(string name = "pwm_transaction");
        super.new(name);
    endfunction

endclass*/
class pwm_transaction extends uvm_sequence_item;

    rand bit [7:0] Dutycycle;
    bit pwmout;

    constraint duty_c {
        Dutycycle inside {[0:99]};
    }

    `uvm_object_utils(pwm_transaction)

    function new(string name = "pwm_transaction");
        super.new(name);
    endfunction

endclass

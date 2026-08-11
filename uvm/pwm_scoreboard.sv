class pwm_scoreboard extends uvm_scoreboard;

  `uvm_component_utils(pwm_scoreboard)

  uvm_analysis_imp #(pwm_transaction, pwm_scoreboard) sb_port;

 
  int ref_counter;

  function new(string name = "pwm_scoreboard",uvm_component parent);
    super.new(name, parent);
    ref_counter = 0;
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sb_port = new("sb_port", this);
  endfunction

  function void write(pwm_transaction tr);

    bit expected_pwm;

    
    if (ref_counter == 99)
      ref_counter = 0;
    else
      ref_counter = ref_counter + 1;

    expected_pwm = (ref_counter < tr.Dutycycle);

    if (expected_pwm == tr.pwmout)
      `uvm_info("SCOREBOARD",$sformatf("PASS : Duty=%0d RefCounter=%0d PWM=%0b",tr.Dutycycle, ref_counter, tr.pwmout),UVM_HIGH)
    else
      `uvm_error("SCOREBOARD",$sformatf("FAIL : Duty=%0d RefCounter=%0d Expected=%0b Actual=%0b",tr.Dutycycle, ref_counter,expected_pwm, tr.pwmout))

  endfunction

endclass

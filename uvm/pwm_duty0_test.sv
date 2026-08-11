class pwm_duty0_test extends uvm_test;

  `uvm_component_utils(pwm_duty0_test)

  pwm_env env;

  function new(string name = "pwm_duty0_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = pwm_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);

    pwm_duty0_sequence seq0;

    phase.raise_objection(this);

    seq0 = pwm_duty0_sequence::type_id::create("seq0");
    seq0.start(env.agent.sequencer);

    phase.drop_objection(this);

  endtask

endclass

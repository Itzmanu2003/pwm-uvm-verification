class pwm_duty50_test extends uvm_test;

  `uvm_component_utils(pwm_duty50_test)

  pwm_env env;

  function new(string name = "pwm_duty50_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = pwm_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);

    pwm_duty50_sequence seq50;

    phase.raise_objection(this);

    seq50 = pwm_duty50_sequence::type_id::create("seq50");
    seq50.start(env.agent.sequencer);

    phase.drop_objection(this);

  endtask

endclass

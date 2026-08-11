class pwm_duty99_test extends uvm_test;

  `uvm_component_utils(pwm_duty99_test)

  pwm_env env;

  function new(string name = "pwm_duty99_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = pwm_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);

    pwm_duty99_sequence seq99;

    phase.raise_objection(this);

    seq99 = pwm_duty99_sequence::type_id::create("seq99");
    seq99.start(env.agent.sequencer);

    phase.drop_objection(this);

  endtask

endclass

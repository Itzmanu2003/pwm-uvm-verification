class pwm_duty25_test extends uvm_test;

  `uvm_component_utils(pwm_duty25_test)

  pwm_env env;

  function new(string name = "pwm_duty25_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = pwm_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);

    pwm_duty25_sequence seq25;

    phase.raise_objection(this);

    seq25 = pwm_duty25_sequence::type_id::create("seq25");
    seq25.start(env.agent.sequencer);

    phase.drop_objection(this);

  endtask

endclass

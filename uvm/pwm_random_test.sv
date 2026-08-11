class pwm_random_test extends uvm_test;

  `uvm_component_utils(pwm_random_test)

  pwm_env env;

  function new(string name = "pwm_random_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = pwm_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);

    pwm_random_sequence seq_rand;

    phase.raise_objection(this);

    seq_rand = pwm_random_sequence::type_id::create("seq_rand");
    seq_rand.start(env.agent.sequencer);

    phase.drop_objection(this);

  endtask

endclass

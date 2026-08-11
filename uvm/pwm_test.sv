class pwm_test extends uvm_test;

  `uvm_component_utils(pwm_test)

  pwm_env env;

  function new(string name = "pwm_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = pwm_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);

    pwm_duty0_sequence       seq0;
    pwm_duty25_sequence      seq25;
    pwm_duty50_sequence      seq50;
    pwm_duty75_sequence      seq75;
    pwm_duty99_sequence      seq99;
    pwm_transition_sequence  seq_trans;
    pwm_random_sequence      seq_rand;

    phase.raise_objection(this);

    seq0 = pwm_duty0_sequence::type_id::create("seq0");
    seq0.start(env.agent.sequencer);

    seq25 = pwm_duty25_sequence::type_id::create("seq25");
    seq25.start(env.agent.sequencer);

    seq50 = pwm_duty50_sequence::type_id::create("seq50");
    seq50.start(env.agent.sequencer);

    seq75 = pwm_duty75_sequence::type_id::create("seq75");
    seq75.start(env.agent.sequencer);

    seq99 = pwm_duty99_sequence::type_id::create("seq99");
    seq99.start(env.agent.sequencer);

    seq_trans = pwm_transition_sequence::type_id::create("seq_trans");
    seq_trans.start(env.agent.sequencer);

    seq_rand = pwm_random_sequence::type_id::create("seq_rand");
    seq_rand.start(env.agent.sequencer);

    phase.drop_objection(this);

  endtask

endclass

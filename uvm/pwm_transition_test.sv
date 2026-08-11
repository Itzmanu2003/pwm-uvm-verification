class pwm_transition_test extends uvm_test;

  `uvm_component_utils(pwm_transition_test)

  pwm_env env;

  function new(string name = "pwm_transition_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = pwm_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);

    pwm_transition_sequence seq_trans;

    phase.raise_objection(this);

    seq_trans = pwm_transition_sequence::type_id::create("seq_trans");
    seq_trans.start(env.agent.sequencer);

    phase.drop_objection(this);

  endtask

endclass

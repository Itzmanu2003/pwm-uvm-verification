class pwm_env extends uvm_env;

    `uvm_component_utils(pwm_env)

    pwm_agent      agent;
    pwm_scoreboard scoreboard;
    pwm_coverage   coverage;

    function new(string name = "pwm_env",
                 uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        agent      = pwm_agent::type_id::create("agent", this);
        scoreboard = pwm_scoreboard::type_id::create("scoreboard", this);
        coverage   = pwm_coverage::type_id::create("coverage", this);

    endfunction

    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);

        agent.monitor.mon_ap.connect(scoreboard.sb_port);

        agent.monitor.mon_ap.connect(coverage.analysis_export);

    endfunction

endclass

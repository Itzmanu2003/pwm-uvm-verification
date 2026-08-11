package pwm_pkg;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // Transaction
    `include "pwm_transaction.sv"

    // Sequences
    `include "pwm_duty0_sequence.sv"
    `include "pwm_duty25_sequence.sv"
    `include "pwm_duty50_sequence.sv"
    `include "pwm_duty75_sequence.sv"
    `include "pwm_duty99_sequence.sv"
    `include "pwm_transition_sequence.sv"
    `include "pwm_random_sequence.sv"

    // Sequencer
    `include "pwm_sequencer.sv"

    // Driver
    `include "pwm_driver.sv"

    // Monitor
    `include "pwm_monitor.sv"

    // Agent
    `include "pwm_agent.sv"

    // Scoreboard
    `include "pwm_scoreboard.sv"

    // Coverage
    `include "pwm_coverage.sv"

    // Environment
    `include "pwm_env.sv"

    // Tests
    `include "pwm_test.sv"
    `include "pwm_duty0_test.sv"
    `include "pwm_duty25_test.sv"
    `include "pwm_duty50_test.sv"
    `include "pwm_duty75_test.sv"
    `include "pwm_duty99_test.sv"
    `include "pwm_transition_test.sv"
    `include "pwm_random_test.sv"

endpackage

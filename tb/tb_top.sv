
module tb_top;

    import uvm_pkg::*;
    import pwm_pkg::*;
    `include "uvm_macros.svh"

    // Interface
    pwm_if vif();
    logic [7:0] counter_dummy;

    // DUT Instantiation
    Variable_PWM dut (
        .Dutycycle(vif.Dutycycle),
        .clk(vif.clk),
        .counter(counter_dummy),
        .pwmout(vif.pwmout)
    );

   initial begin
    $fsdbDumpfile("waves.fsdb");
    $fsdbDumpvars(0, tb_top);
    $fsdbDumpMDA();
end
    // Clock Generation
    initial begin
        vif.clk = 0;
        forever #10 vif.clk = ~vif.clk;
    end

    // UVM Configuration and Test Start
    initial begin

        uvm_config_db#(virtual pwm_if)::set(null, "*","vif",vif);

         uvm_top.set_timeout(11000000, 1);                                  
        run_test("pwm_test");

    end

endmodule


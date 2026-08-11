class pwm_monitor extends uvm_monitor;

    `uvm_component_utils(pwm_monitor)

    virtual pwm_if vif;

    uvm_analysis_port #(pwm_transaction) mon_ap;

    function new(string name = "pwm_monitor",
                 uvm_component parent);
        super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        mon_ap = new("mon_ap",this);

        if(!uvm_config_db #(virtual pwm_if)::get(this,"","vif",vif))
            `uvm_fatal("NOVIF","Virtual Interface not found")

    endfunction

   task run_phase(uvm_phase phase);

    pwm_transaction tr;

    forever begin
        @(posedge vif.clk);
        #1; // small delta so counter/pwmout have settled after the edge

        tr = pwm_transaction::type_id::create("tr");

        tr.Dutycycle = vif.Dutycycle;
        tr.pwmout    = vif.pwmout;

        mon_ap.write(tr);
    end

endtask

        

endclass

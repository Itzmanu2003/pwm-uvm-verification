COMPFLAGS = -sverilog -full64 -kdb -lca -ntb_opts uvm +incdir+./uvm

RUN_OPTS =

COV_DIR = $(if $(TEST),cov_$(TEST).vdb,simv.vdb)

ifeq ($(WAVE),1)
COMPFLAGS += -debug_pp -debug_access+all +define+WAVES
endif


ifeq ($(COV),1)
COMPFLAGS += -cm line+cond+branch+tgl
RUN_OPTS  += -cm line+cond+branch+tgl -cm_dir $(COV_DIR) -cm_name $(if $(TEST),$(TEST),pwm_test)
endif

ifdef TEST
RUN_OPTS += +UVM_TESTNAME=$(TEST)
endif


TESTS = pwm_duty0_test pwm_duty25_test pwm_duty50_test pwm_duty75_test \
        pwm_duty99_test pwm_transition_test pwm_random_test

all: compile run waves

compile:
	@echo "Compiling PWM UVM Testbench..."
	vcs $(COMPFLAGS) \
	pwm.v \
	uvm/pwm_if.sv \
	uvm/pwm_pkg.sv \
	tb/tb_top.sv

run:
	./simv $(RUN_OPTS)


regression:
	@for t in $(TESTS); do \
		echo "==== Running $$t ===="; \
		./simv -cm line+cond+branch+tgl -cm_dir cov_$$t.vdb -cm_name $$t +UVM_TESTNAME=$$t; \
	done

merge:
	urg -full64 -dir $(foreach t,$(TESTS),cov_$(t).vdb) -dbname merged.vdb -format both -report urgReport_merged
	@echo "Merged coverage written to urgReport_merged/ and merged.vdb"


mergereport:
	verdi -cov -covdir merged.vdb

waves:
	verdi -ssf waves.fsdb


covreport:
	verdi -cov -covdir simv.vdb


urgreport:
	urg -dir simv.vdb -format text -report urgReport

clean:
	rm -rf simv* csrc .vdb *.fsdb novas .log ucli vc_hdrs.h DVEfiles simv.vdb urgReport cov_*.vdb merged.vdb urgReport_merged

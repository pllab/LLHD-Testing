.PHONY: foo-sim accum-sim

foo.llhd: foo.sv
	moore $< -e hello_world > $@

# This is the example from the paper, which currently
# doesn't work with Moore. Including here for reference.
acc.llhd: acc.sv
	moore $< -e acc_tb > $@

acc-sim: acc.llhd
	llhd-sim $< -N 10000 -o acc.vcd

alu.llhd: alu.sv
	moore $< -e top > $@

alu-sim: alu.llhd
	llhd-sim $< -N 10000 -o alu.vcd
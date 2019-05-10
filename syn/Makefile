DESIGN=alu

setup:
	../setup_synopsys.csh

prepare: setup
	ln -sf ../rtl/${DESIGN}.v

synthesis:
	dc_shell -f ${DESIGN}.tcl

syn: synthesis

${DESIGN}_gate.v: synthesis

sim:
	vcs -debug_access+pp -f ${DESIGN}_gate_tb.vc

run: sim
	./simv

gui: sim
	./simv -gui=dve

clean:
	rm -rf *_gate.rpt *_gate.sdc *_gate.sdf *gate.v command.log default.svf csrc simv.daidir DVEfiles simv ucli.key vcdplus.vpd

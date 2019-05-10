DESIGN=alu

prepare:
	ln -sf ../syn/${DESIGN}_gate.sdc
	ln -sf ../syn/${DESIGN}_gate.v
	ln -sf /users/davidng/elec4642/pnr/tsmc13_mmmc.view analysis.view
	ln -sf /cad/tech/Artisan.TSMC.130/aci/sc-x/lef/tsmc13_8lm.lef
	ln -sf /cad/tech/Artisan.TSMC.130/aci/sc-x/lef/tsmc13_8lm_antenna.lef
	ln -sf /cad/tech/Artisan.TSMC.130/aci/sc-x/gds2/tsmc13.gds2

gui:
	innovus

clean:
	rm -rf .cadence innovus* timingReports *.rpt *.def *.gds2 *.spef *.map

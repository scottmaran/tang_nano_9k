

// runs all the commands to synthesis, route, and program a tangnano9k board
tangnano9k:
	yosys -p "read_verilog counter.v; synth_gowin -top counter -json counter.json"
	nextpnr-himbaechel --json counter.json --write counter_pnr.json --device GW1NR-LV9QN88PC6/I5 --vopt family=GW1N-9C --vopt cst=tangnano9k.cst
	gowin_pack -d GW1N-9C -o pack.fs counter_pnr.json
	openFPGALoader -b tangnano9k -f pack.fs
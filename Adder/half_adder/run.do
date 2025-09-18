//Compilation
vlog tb_half_adder.v //top file
//Elaboration
vsim work.tb
//Add Wave
add wave -position sim:/tb/dut/*
//Simulation
run -all


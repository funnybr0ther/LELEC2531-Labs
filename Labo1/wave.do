# The $ sign can be used to pass argument through the “do” command ($1 for the first, $2 for the second, etc.)
if {$1 == 0} {
# restart the simulation (can be useful if you add a new signal to the Wave)
restart –f
} else {
# delete all signals in the Wave (actually not necessary if you start a new simulation (with vsim))
delete wave *
# recompile all ".sv" files (warning: unlike using the "Compile ..." buttons of the ModelSim GUI,
# this will not update the file "Status"). Obviously, this becomes not really efficient with large designs
vlog *.sv
# restart a simulation (necessary if you recompile one of your design files)
vsim -gui -t ns work.test_fulladder_4bit
#
# replace this comment by the commands that were already present in the file
#
}
run 50 ns
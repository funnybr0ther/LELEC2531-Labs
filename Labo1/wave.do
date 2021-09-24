if {$1 == 0} {
    restart –f
} else {
    view wave -undock
    delete wave *
    vsim -gui -t ns work.test_Homework_1
}
exec sh /home/guillaume/myCommand.sh
run 50 ns 
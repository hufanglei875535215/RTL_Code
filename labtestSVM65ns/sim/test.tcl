stop -condition { #Testbench.fsm.state==7'b0000100 &&#Testbench.fsm.clk==0 }
##stop -condition { #Testbench.fsm.ready==1 &&#Testbench.fsm.clk==0 }

dumptcf -scope Testbench.fsm -output tcf.dump -overwrite
run
dumptcf -end
exit

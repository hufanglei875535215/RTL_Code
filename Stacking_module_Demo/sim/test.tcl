##stop -condition { #Testbench2.fsm.state=8'b00000100 }
#stop -condition { #Testbench2.fsm.ready==1 && #Testbench2.fsm.clk=0 }
##stop -condition { #AdaBoostTopBagging_Test.bagging.total_predict==1 && #AdaBoostTopBagging_Test.bagging.clk==0 }
#stop -condition { #Stacking_Module_Test.top.flag==1 }
stop -condition { #Stacking_Module_Test.top.total_ready==1 && #Stacking_Module_Test.top.clk==0 }
dumptcf -scope Stacking_Module_Test.top -output tcf.dump -overwrite
run
dumptcf -end
exit

##stop -condition { #Testbench2.fsm.state=8'b00000100 }
#stop -condition { #Testbench2.fsm.ready==1 && #Testbench2.fsm.clk=0 }
stop -condition { #AdaBoostTopBagging_Test.bagging.total_predict==1 && #AdaBoostTopBagging_Test.bagging.clk==0 }
##stop -condition { #AdaBoostTopBagging_Test.bagging.flag==1 }
dumptcf -scope AdaBoostTopBagging_Test.bagging -output tcf.dump -overwrite
run
dumptcf -end
exit

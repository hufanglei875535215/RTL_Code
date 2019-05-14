##stop -condition { #TopBaggingTest.bagging.flag==1 && #TopBaggingTest.bagging.clk=0 }
stop -condition { #TopBaggingTest.bagging.total_ready==1 && #TopBaggingTest.bagging.clk=0 }


dumptcf -scope TopBaggingTest.bagging -output tcf.dump -overwrite
run
dumptcf -end
exit

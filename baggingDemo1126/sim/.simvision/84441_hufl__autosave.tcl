
# NC-Sim Command File
# TOOL:	ncsim	15.10-s002
#

set tcl_prompt1 {puts -nonewline "ncsim> "}
set tcl_prompt2 {puts -nonewline "> "}
set vlog_format %h
set vhdl_format %v
set real_precision 6
set display_unit auto
set time_unit module
set heap_garbage_size -200
set heap_garbage_time 0
set assert_report_level note
set assert_stop_level error
set autoscope yes
set assert_1164_warnings yes
set pack_assert_off {}
set severity_pack_assert_off {note warning}
set assert_output_stop_level failed
set tcl_debug_level 0
set relax_path_name 1
set vhdl_vcdmap XX01ZX01X
set intovf_severity_level ERROR
set probe_screen_format 0
set rangecnst_severity_level ERROR
set textio_severity_level ERROR
set vital_timing_checks_on 1
set vlog_code_show_force 0
set assert_count_attempts 1
set tcl_all64 false
set tcl_runerror_exit false
set assert_report_incompletes 0
set show_force 1
set force_reset_by_reinvoke 0
set tcl_relaxed_literal 0
set probe_exclude_patterns {}
set probe_packed_limit 4k
set probe_unpacked_limit 16k
set assert_internal_msg no
set svseed 1
set assert_reporting_mode 0
alias iprof profile
database -open -shm -into waves.shm waves -default
probe -create -database waves TopBaggingTest.bias1 TopBaggingTest.bias2 TopBaggingTest.bias3 TopBaggingTest.clk TopBaggingTest.data TopBaggingTest.data1 TopBaggingTest.data2 TopBaggingTest.data3 TopBaggingTest.en TopBaggingTest.flag TopBaggingTest.i TopBaggingTest.ii TopBaggingTest.j TopBaggingTest.jj TopBaggingTest.k TopBaggingTest.kk TopBaggingTest.read1 TopBaggingTest.read2 TopBaggingTest.read3 TopBaggingTest.rst TopBaggingTest.total_ready TopBaggingTest.total_result TopBaggingTest.weight1 TopBaggingTest.weight1M TopBaggingTest.weight2 TopBaggingTest.weight2M TopBaggingTest.weight3 TopBaggingTest.weight3M TopBaggingTest.write1 TopBaggingTest.write2 TopBaggingTest.write3 TopBaggingTest.bagging.address1 TopBaggingTest.bagging.address2 TopBaggingTest.bagging.address3 TopBaggingTest.bagging.bias1 TopBaggingTest.bagging.bias2 TopBaggingTest.bagging.bias3 TopBaggingTest.bagging.clk TopBaggingTest.bagging.data1 TopBaggingTest.bagging.data2 TopBaggingTest.bagging.data3 TopBaggingTest.bagging.en TopBaggingTest.bagging.finish1 TopBaggingTest.bagging.finish2 TopBaggingTest.bagging.finish3 TopBaggingTest.bagging.flag TopBaggingTest.bagging.read1 TopBaggingTest.bagging.read2 TopBaggingTest.bagging.read3 TopBaggingTest.bagging.ready1 TopBaggingTest.bagging.ready2 TopBaggingTest.bagging.ready3 TopBaggingTest.bagging.result1 TopBaggingTest.bagging.result2 TopBaggingTest.bagging.result3 TopBaggingTest.bagging.rst TopBaggingTest.bagging.total_predict TopBaggingTest.bagging.total_ready TopBaggingTest.bagging.weight1 TopBaggingTest.bagging.weight1out TopBaggingTest.bagging.weight2 TopBaggingTest.bagging.weight2out TopBaggingTest.bagging.weight3 TopBaggingTest.bagging.weight3out TopBaggingTest.bagging.write1 TopBaggingTest.bagging.write2 TopBaggingTest.bagging.write3 TopBaggingTest.bagging.bagging1.bias TopBaggingTest.bagging.bagging1.clk TopBaggingTest.bagging.bagging1.data TopBaggingTest.bagging.bagging1.en TopBaggingTest.bagging.bagging1.i TopBaggingTest.bagging.bagging1.ready TopBaggingTest.bagging.bagging1.result TopBaggingTest.bagging.bagging1.rst TopBaggingTest.bagging.bagging1.state TopBaggingTest.bagging.bagging1.temp TopBaggingTest.bagging.bagging1.weight TopBaggingTest.bagging.bagging2.bias TopBaggingTest.bagging.bagging2.clk TopBaggingTest.bagging.bagging2.data TopBaggingTest.bagging.bagging2.en TopBaggingTest.bagging.bagging2.i TopBaggingTest.bagging.bagging2.ready TopBaggingTest.bagging.bagging2.result TopBaggingTest.bagging.bagging2.rst TopBaggingTest.bagging.bagging2.state TopBaggingTest.bagging.bagging2.temp TopBaggingTest.bagging.bagging2.weight TopBaggingTest.bagging.bagging3.bias TopBaggingTest.bagging.bagging3.clk TopBaggingTest.bagging.bagging3.data TopBaggingTest.bagging.bagging3.en TopBaggingTest.bagging.bagging3.i TopBaggingTest.bagging.bagging3.ready TopBaggingTest.bagging.bagging3.result TopBaggingTest.bagging.bagging3.rst TopBaggingTest.bagging.bagging3.state TopBaggingTest.bagging.bagging3.temp TopBaggingTest.bagging.bagging3.weight TopBaggingTest.bagging.m1.address TopBaggingTest.bagging.m1.clk TopBaggingTest.bagging.m1.datain TopBaggingTest.bagging.m1.dataout TopBaggingTest.bagging.m1.finish TopBaggingTest.bagging.m1.memory TopBaggingTest.bagging.m1.read TopBaggingTest.bagging.m1.write TopBaggingTest.bagging.m2.address TopBaggingTest.bagging.m2.clk TopBaggingTest.bagging.m2.datain TopBaggingTest.bagging.m2.dataout TopBaggingTest.bagging.m2.finish TopBaggingTest.bagging.m2.memory TopBaggingTest.bagging.m2.read TopBaggingTest.bagging.m2.write TopBaggingTest.bagging.m3.address TopBaggingTest.bagging.m3.clk TopBaggingTest.bagging.m3.datain TopBaggingTest.bagging.m3.dataout TopBaggingTest.bagging.m3.finish TopBaggingTest.bagging.m3.memory TopBaggingTest.bagging.m3.read TopBaggingTest.bagging.m3.write

simvision -input /workspace/home/hufl/weiminghu_Synth/baggingDemo1126/sim/.simvision/84441_hufl__autosave.tcl.svcf

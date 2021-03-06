// Generated by Cadence Encounter(R) RTL Compiler RC14.11 - v14.10-s012_1
tclmode
set env(RC_VERSION) "RC14.11 - v14.10-s012_1"
vpxmode
set dofile abort exit
usage -auto -elapse
set log file fv/fsm_HandEn/rtl_to_g1.log -replace
tclmode
set ver [lindex [split [lindex [get_version_info] 0] "-"] 0]
vpxmode
tclmode
set env(CDN_SYNTH_ROOT) /eda/cadence/2014-15/RHELx86/RC_14.11.000/tools
set CDN_SYNTH_ROOT /eda/cadence/2014-15/RHELx86/RC_14.11.000/tools
vpxmode
tclmode
if {$ver >= 08.10} {
  vpx set naming style rc
}
vpxmode
set naming rule "%s[%d]" -instance_array
set naming rule "%s_reg" -register -golden
set naming rule "%L.%s" "%L[%d].%s" "%s" -instance
set naming rule "%L.%s" "%L[%d].%s" "%s" -variable
set undefined cell black_box -noascend -both
set undriven signal Z -golden

add search path -library   /workspace/home/hufl/gsclib045_svt_v4.4/GSCLIB045/timing/  
read library -statetable -liberty -both  \
	/workspace/home/hufl/gsclib045_svt_v4.4/GSCLIB045/timing/slow_vdd1v2_basicCells.lib \
	/workspace/home/hufl/gsclib045_svt_v4.4/GSCLIB045/timing/slow_vdd1v2_extvdd1v0.lib \
	/workspace/home/hufl/gsclib045_svt_v4.4/GSCLIB045/timing/slow_vdd1v2_extvdd1v2.lib \
	/workspace/home/hufl/gsclib045_svt_v4.4/GSCLIB045/timing/slow_vdd1v2_multibitsDFF.lib

delete search path -all
add search path -design ../src
tclmode
if {$ver < 13.10} {
vpx read design  -verilog2k  -define SYNTHESIS  -golden -lastmod -noelab \
	../src/Enstorage.v
} else {
vpx read design  -verilog2k  -define SYNTHESIS  -merge bbox -golden -lastmod -noelab \
	../src/Enstorage.v
}
vpxmode

delete search path -all
add search path -design ../src
tclmode
if {$ver < 13.10} {
vpx read design  -verilog2k  -define SYNTHESIS  -golden -lastmod -noelab \
	../src/fsm_HandEn.v
} else {
vpx read design  -verilog2k  -define SYNTHESIS  -merge bbox -golden -lastmod -noelab \
	../src/fsm_HandEn.v
}
vpxmode

delete search path -all
add search path -design ../src
tclmode
if {$ver < 13.10} {
vpx read design  -verilog2k  -define SYNTHESIS  -golden -lastmod -noelab \
	../src/testDataModule.v
} else {
vpx read design  -verilog2k  -define SYNTHESIS  -merge bbox -golden -lastmod -noelab \
	../src/testDataModule.v
}
vpxmode

elaborate design -golden -root fsm_HandEn -rootonly \

tclmode
if {$ver < 13.10} {
vpx read design -verilog -revised -lastmod -noelab \
	-unzip fv/fsm_HandEn/g1.v.gz
} else {
vpx read design -verilog95 -revised -lastmod -noelab \
	-unzip fv/fsm_HandEn/g1.v.gz
}
vpxmode

elaborate design -revised -root fsm_HandEn

tclmode
set ver [lindex [split [lindex [get_version_info] 0] "-"] 0]
if {$ver < 13.10} {
vpx substitute blackbox model -golden
}
vpxmode
report design data
report black box

uniquify -all -nolib
set flatten model -seq_constant -seq_constant_x_to 0
set flatten model -nodff_to_dlat_zero -nodff_to_dlat_feedback
// set parallel option -threads 4 -license xl -norelease_license
// set compare options -threads 0
set flatten model -gated_clock
set analyze option -auto

write hier_compare dofile fv/fsm_HandEn/hier_rtl_to_g1.do \
	-noexact_pin_match -constraint -usage -replace -balanced_extraction -input_output_pin_equivalence \
	-prepend_string "analyze datapath -module -verbose; usage; analyze datapath -verbose"
run hier_compare fv/fsm_HandEn/hier_rtl_to_g1.do -analyze_abort  -dynamic_hierarchy
// report hier_compare result -dynamicflattened
set system mode lec
tclmode
puts "No of diff points    = [get_compare_points -NONequivalent -count]"
if {[get_compare_points -NONequivalent -count] > 0} {
    puts "------------------------------------"
    puts "ERROR: Different Key Points detected"
    puts "------------------------------------"
#     foreach i [get_compare_points -NONequivalent] {
#         vpx report test vector [get_keypoint $i]
#         puts "     ----------------------------"
#     }
}
vpxmode
exit -force

#!/bin/bash
echo "the data is stored in file"
if [ $# -gt 1 ]
then
	temp=$1
	nums=$2
else
	echo "enter two parameters"
	exit
fi

cd synthesis
path=`pwd`
echo $path
src_path="${path}/script/syn_RISC.scr"
#sed -n '/period 5000/p' $src_path 
sed -in "s/period 5000/period ${temp}/g" $src_path
make synth
sed -in "s/period ${temp}/period 5000/g" $src_path

echo "-----------this is the second simulation------------------"
echo "----------------------------------------------------------"
echo "----------------------------------------------------------"
echo "----------------------------------------------------------"
cd ..
path2=`pwd`
echo $path2
testbench_Path="${path2}/src/Testbench.v"
#sed -ni "s/always #2.5 clk/always #${nums} clk/g" $testbench_Path 
#sed -n '/always #2.5/p' $testbench_Path
sed -in "s/always #2.5 clk/always #${nums} clk/g" $testbench_Path
cd sim
make comp_synth
make elab_synth 
#make gui
sed -in "s/always #${nums} clk/always #2.5 clk/g" $testbench_Path

echo "this is the power of the simulation"
make tcf

cd ../synthesis
make power
cd report
echo "-------------write the test data  into file-------------------------"
echo "---the synthesis time ${temp}--------------the test clk is ${nums}---------" >> testfile.txt
echo "-module------------------------cells-----LP--------DP-------Total---" >> testfile.txt
sed -n "/^fsm/p" fsm_Hand_tcf_tcf.power  >> testfile.txt
sed -n "/^  svmdata/p" fsm_Hand_tcf_tcf.power  >> testfile.txt
tail -n 2 *_tcf_tcf.gates >> testfile.txt
echo "----------------------------------------------------------------------" >> testfile.txt

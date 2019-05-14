#!/bin/bash
if [ $# -ge 2 ] 
then
	temp=$1
else 
 	echo "the clk of synthsis is not getted"
	exit 
fi

echo "---------this is the first part of simulation---------------"
echo "------------------------------------------------------------"
echo "------------------------------------------------------------"
echo "------------------------------------------------------------"
echo "------------------------------------------------------------"
cd sim
make comp
make elab
make gui
echo "----------------------------------------------"
read -t 10 -p "the simulation is right Y/N:----------" tmp
if [ "$tmp"='Y' ] 
then
	echo "the simulation is right"
else
	echo " the simulation is wrong"
	exit
fi
echo "-----------this is the synthsis part------------------------"
echo "------------------------------------------------------------"
echo "------------------------------------------------------------"
echo "------------------------------------------------------------"
cd ..
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
nums=$2
testbench_Path="${path2}/src/TopBaggingTest.v"
#sed -ni "s/always #2.5 clk/always #${nums} clk/g" $testbench_Path 
#sed -n '/always #2.5/p' $testbench_Path
sed -in "s/always #2.5 clk/always #${nums} clk/g" $testbench_Path
cd sim
make comp_synth
make elab_synth
make gui_synth
sed -in "s/always #${nums} clk/always #2.5 clk/g" $testbench_Path 


echo "--------------------this is the power ananlysis------------------------"
make tcf

echo " the tcf file is ready"
cd ../synthesis
make power
cd report
echo "total----------------------------- Ins---------------------------area "
#sed -n "${line}p" *_tcf.gates
tail -n 2 *_tcf.gates
echo "----------------------------------power--------------------------------"

sed -n "11,14p" *_tcf.power

cd ../rpt
echo  "-----------------------------timing slack-----------------------------"
sed -n "14,16p" *.summary.rpt



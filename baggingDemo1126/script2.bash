#!/bin/bash
echo "--------------------this is the power ananlysis------------------------"
cd sim
make tcf

echo " the tcf file is ready"
cd ../synthesis
make power
cd report
echo "total-------------- Ins------area "
sed -n "82p" *_tcf.gates

echo "----------------------------------power--------------------------------"

sed -n "11,14p" *_tcf.power

cd ../rpt
echo  "-----------------------------timing slack-----------------------------"
sed -n "14,16p" *.summary.rpt

 



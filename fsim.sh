#!/bin/bash 
#
# Program
#   Fault Simulation: 
#       Iterate through target faults to evaluate the fault coverage  
#
# History 
# 2016/01/02    by xenia-cjen 
#
 
# set parameter 
MATCH=force

FAULT_LIST=./irst/mips_16_core_irst.fault 

TB=./testfixture.v 
TB_OUT=./mips_16_core.out
GOLDEN=./mips_16_core.golden

FSIM_OUT=./fsim.rpt 
##############################
nfault=0
det=0
cat $FAULT_LIST | while read fault_inject; do 
    nfault=$(($nfault+1))

    sed -i "s/$MATCH.*/$fault_inject/" $TB 
    #make irst IRST_COM_OPTS=-NOSTDOUT 
    make irst
    diff --brief $TB_OUT $GOLDEN
    res=$?
    if [ $res -eq 1 ]; then 
        det=$(($det+1))
    fi
    echo "$det/$nfault fault(s) detect..." >> $FSIM_OUT
    make clean 
done 

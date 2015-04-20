#!/bin/bash

source .cshrc
make irst
mv mips_16_core.vcd fsim/fsim.evcd
tmax -nogui fsim/fsim.tcl
make clean

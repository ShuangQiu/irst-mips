#!/bin/sh
LIB_FILES=""
NETLIST_FILES=" mips_16_core_dft.v tsmc13.v"
DPV_FILE="mips_16_core_atpg_stildpv.v"
SIMULATOR="ncverilog"
if [ -z "${STILDPV_HOME}" -o ! -d "${STILDPV_HOME}" ]
then echo "ERROR: Please define \$STILDPV_HOME to reference a directory"; exit 1;
fi
${SIMULATOR} +access+rw \
${DPV_FILE} ${NETLIST_FILES} ${LIB_FILES}
SIMSTATUS=$?
if [ ${SIMSTATUS} -ne 0 ]
then echo "WARNING: simulation command returned error status ${SIMSTATUS}"; exit ${SIMSTATUS};
fi

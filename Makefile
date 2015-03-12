COM = ncverilog
BENCH = testfixture.v 

COM_OPTS =  
SRC_FILE = $(wildcard rtl/*.v)
OPTION = +VCD

SYN_COM_OPTS = 
SYN_SRC_FILE = mips_16_core_syn.v 
TECH_FILE = tsmc13.v 
SYN_OPTION = 
 	 	
com : $(BENCH) $(SRC_FILE)
	$(COM) $^ +access+r +define$(OPTION)

syn : $(BENCH) $(SYN_SRC_FILE) $(TECH_FILE) mips_16_core_syn.sdf
	$(COM) $(SYN_COM_OPTS) $(BENCH) $(SYN_SRC_FILE) -v $(TECH_FILE) +define+SDF$(SYN_OPTION)

clean :
	@rm -rf *.vcd* tb* ncverilog.* novas.rc 
	@rm -rf INCA_libs nWaveLog VerdiLog vfastLog 

synclean : 
	@rm -rf *-verilog.syn *.mr *.pvl *.log default.svf command.log 

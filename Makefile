COM = ncverilog
BENCH = testfixture.v 

COM_OPTS =  
SRC_FILE = $(wildcard rtl/*.v)
OPTION = +VCD

TECH_FILE = tsmc13.v 

SYN_COM_OPTS = 
SYN_SRC_FILE = mips_16_core_syn.v 
SYN_OPTION = 
 	 	
IRST_COM_OPTS = 
IRST_SRC_FILE = mips_16_core_irst.v 
IRST_OPTION = 

com : $(BENCH) $(SRC_FILE)
	$(COM) $^ +access+r +define$(OPTION)

syn : $(BENCH) $(SYN_SRC_FILE) $(TECH_FILE) mips_16_core_syn.sdf
	$(COM) $(SYN_COM_OPTS) $(BENCH) $(SYN_SRC_FILE) -v $(TECH_FILE) +define+SDF$(SYN_OPTION)

irst : $(BENCH) $(IRST_SRC_FILE) $(TECH_FILE) mips_16_core_irst.sdf
	$(COM) $(IRST_COM_OPTS) $(BENCH) $(IRST_SRC_FILE) -v $(TECH_FILE) +define+SDF$(IRST_OPTION)

clean :
	@rm -rf *.vcd* tb* ncverilog.* novas.rc *.X
	@rm -rf INCA_libs nWaveLog VerdiLog vfastLog 

synclean : 
	@rm -rf *-verilog.syn *.mr *.pvl *.log default.svf command.log 

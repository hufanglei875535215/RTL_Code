################################################################################
##                                                                            ##
##  This confidential and proprietary software may be used only               ##
##  as authorized by a licensing agreement from CoWare, Inc.                  ##
##  In the event of publication, the following notice is applicable:          ##
##                                                                            ##
##      (c) COPYRIGHT 2001-2009 COWARE, INC.                                  ##
##             ALL RIGHTS RESERVED                                            ##
##                                                                            ##
##  The entire notice above must be reproduced on all authorized copies.      ##
##                                                                            ##
################################################################################
##
##  This file was generated automatically by
##  CoWare Processor Generator!
##  Version 2009.1.1 Linux -- May, 2009
## 
##
##      FileName: makefile
##      Date:     Mon Apr 13 2015
## 	Modified: Hailong Jiao
################################################################################


export WORKLIB=work

# Tool settings
VCOMP = ncvlog
VCOMP_OPTIONS = -incdir ${SRC_RTL} -w
VELAB = ncelab
VELAB_OPTIONS = -access +rwc  -timescale 1ns/1ps -work ${WORKLIB}
VSIM = ncsim
VSIM_OPTIONS = 


# settings for RTL simulation
SRC_RTL    = ../src
SCR_NETLIST = ../synthesis/p+r_enc
LIB         = work
TOP_MODULE =Testbench 
SOURCE_TESTBENCH = ${SRC_RTL}/Testbench.v
SOURCES    = ${SRC_RTL}/fsm_Hand.v \
             ${SRC_RTL}/svmstorage.v \
             ${SRC_RTL}/testDataModule.v \
             ${SRC_RTL}/timescale.v \
            	     
NETLIST   =  ${SCR_NETLIST}/fsm_Hand_synth.v \
	     /workspace/technology/tsmc/65nm_GP/Std_cell_lib/tcbn65gplushpbwp/TSMCHOME/digital/Front_End/verilog/tcbn65gplushpbwp_140a/tcbn65gplushpbwp.v 
	     
	     
targets:
	@echo "targets: [ dir | comp | elab | gui | comp_synth | elab_synth | gui_synth | tcf | clean ]"

dir:
	@if [ ! -d ${LIB} ]; then mkdir ${LIB} ; fi
		     
comp: dir ${SOURCES} ${SOURCE_TESTBENCH}
	@if [ ! -d ${LIB} ]; then mkdir ${LIB} ; fi
	${VCOMP} ${VCOMP_OPTIONS} ${LIB} ${SOURCES} ${SOURCE_TESTBENCH}

elab: comp
	${VELAB} ${VELAB_OPTIONS} ${TOP_MODULE}

gui: 	
	${VSIM} -GUI ${VSIM_OPTIONS} ${LIB}.${TOP_MODULE}	

comp_synth: dir ${SOURCES} ${SOURCE_TESTBENCH}
	@if [ ! -d ${LIB} ]; then mkdir ${LIB} ; fi
	${VCOMP} ${VCOMP_OPTIONS} ${LIB} ${NETLIST} ${SOURCE_TESTBENCH}
	
elab_synth: comp_synth
	${VELAB} ${VELAB_OPTIONS} -sdf_file ../synthesis/gate/count.sdf ${TOP_MODULE}

gui_synth:	
	${VSIM} -GUI ${VSIM_OPTIONS} ${LIB}.${TOP_MODULE}
	
tcf:
	${VSIM} -input test.tcl  ${LIB}.${TOP_MODULE}
	
sdf:
	echo "start compiling sdf file...."
	ncsdfc ./gate/LT_RISC_32p5.sdf
	
clean:
	rm -rf ${WORKLIB}
	rm -rf ncelab.log ncsim.key ncsim.log ncvlog.log	

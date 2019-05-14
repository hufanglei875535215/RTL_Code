## Select the technology library
#
#search path library files
set_attribute lib_search_path { \
	/workspace/technology/tsmc/65nm_GP/Std_cell_lib/tcbn65gplushpbwp/TSMCHOME/digital/Front_End/timing_power_noise/ECSM/tcbn65gplushpbwp_140a/ \
	} ;

#target library
set_attribute library { \
	tcbn65gplushpbwpwc_ecsm.lib \
	} ;	
	


#set operating conditions
find /lib* -operating_condition *
ls -attribute /libraries/tcbn65gplushpbwpwc_ecsm/operating_conditions/WCCOM

#-----------------------------------------------------------------------
# Physical libraries
#-----------------------------------------------------------------------
# LEF for standard cells and macros

set tech_lef { \ 
	/workspace/technology/tsmc/65nm_GP/Std_cell_lib/tcbn65gplushpbwp/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/lef/tcbn65gplushpbwp_9lmT2.lef }

#cap tables

set captables "/workspace/technology/tsmc/65nm_GP/Std_cell_lib/tcbn65gplushpbwp/TSMCHOME/digital/Back_End/lef/tcbn65gplushpbwp_140a/techfiles/captable/cln65g+_1p09m+alrdl_rcworst_top2.captable"


#-----------------------------------------------------------------------
# Other variables
#-----------------------------------------------------------------------



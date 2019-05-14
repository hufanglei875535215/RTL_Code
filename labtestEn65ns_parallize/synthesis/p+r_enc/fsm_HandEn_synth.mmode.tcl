create_library_set -name default_library_set -timing /workspace/technology/tsmc/65nm_GP/Std_cell_lib/tcbn65gplushpbwp/TSMCHOME/digital/Front_End/timing_power_noise/ECSM/tcbn65gplushpbwp_140a//tcbn65gplushpbwpwc_ecsm.lib
create_rc_corner -name _default_rc_corner_ -T 125.0
create_delay_corner -name _default_delay_corner_ -library_set default_library_set -opcond WCCOM  -opcond_library tcbn65gplushpbwpwc_ecsm -rc_corner _default_rc_corner_
create_constraint_mode -name _default_constraint_mode_ -sdc_files {./p+r_enc/fsm_HandEn_synth._default_constraint_mode_.sdc}
 
create_analysis_view -name _default_view_  -constraint_mode _default_constraint_mode_ -delay_corner _default_delay_corner_
 
 
set_analysis_view -setup _default_view_  -hold _default_view_
 

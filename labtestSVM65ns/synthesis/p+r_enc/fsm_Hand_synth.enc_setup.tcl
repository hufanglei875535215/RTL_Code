#####################################################################
#
# First Encounter setup file
# Created by Encounter(R) RTL Compiler on 12/04/2018 16:05:30
#
#####################################################################


# This script is intended for use with Encounter version 4.2 or later.
#   Multiple timing modes require Encounter version 5.2 or later.
#   CPF requires Encounter version 6.2 or later.


# Design Import
###########################################################
source ./p+r_enc/fsm_Hand_synth.globals
init_design


# Mode Setup
###########################################################
source ./p+r_enc/fsm_Hand_synth.mode

# Import list of instances with subdesigns having boundary optimization disabled
################################################################################
setOptMode -keepPort ./p+r_enc/fsm_Hand_synth.boundary_opto.tcl 



# The following is partial list of suggested prototyping commands.
# These commands are provided for reference only.
# Please consult the First Encounter documentation for more information.
#   Placement...
#     ecoPlace                     ;# legalizes placement including placing any cells that may not be placed
#     - or -
#     placeDesign -incremental     ;# adjusts existing placement
#     - or -
#     placeDesign                  ;# performs detailed placement discarding any existing placement
#   Optimization & Timing...
#     optDesign -preCTS            ;# performs trial route and optimization
#     timeDesign -preCTS           ;# performs timing analysis


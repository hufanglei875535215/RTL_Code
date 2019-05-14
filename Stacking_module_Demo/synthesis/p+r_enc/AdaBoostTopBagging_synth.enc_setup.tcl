#####################################################################
#
# First Encounter setup file
# Created by Encounter(R) RTL Compiler on 12/07/2018 12:18:21
#
#####################################################################


# This script is intended for use with Encounter version 4.2 or later.
#   Multiple timing modes require Encounter version 5.2 or later.
#   CPF requires Encounter version 6.2 or later.


# Design Import
###########################################################
source ./p+r_enc/AdaBoostTopBagging_synth.globals
init_design


# Mode Setup
###########################################################
source ./p+r_enc/AdaBoostTopBagging_synth.mode

# Import list of instances with subdesigns having boundary optimization disabled
################################################################################
setOptMode -keepPort ./p+r_enc/AdaBoostTopBagging_synth.boundary_opto.tcl 


# Import list of size_only instances
######################################
setOptMode -sizeOnlyFile ./p+r_enc/AdaBoostTopBagging_synth.size_ok.tcl 



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


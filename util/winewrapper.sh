#!/bin/bash
# Wrapper script arround wine for modelsim on OS X:
# 1) install wine (i.e. via homebrew)
# 2) install modelsim with wine (altera edition works fine)
# 3) copy this script to someplace in your path
# 4) create simlinks to this script at the same place as the script named 
#    like the commands intended to be run via wine - including vsim, vcom, 
#    vlib, vlog...

COMMAND=$(basename $0)
WINEDEBUG=-all wine $COMMAND $*

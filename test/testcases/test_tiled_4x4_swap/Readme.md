4x4 tiled noc test bench with port swapping
==========
This directory contains a tiled 4x4 noc test case with an all-2-all schedule as well as intitialisation files for the traffic generators. The ports of some tiles are swapped to enable a better layout and the schedule was created taking this into account.

# Files #
- *all_to_all.sched* schedule file, specifically created to support the port swapping
- *SPM_init.dat* initial values for the scratch pad memory
- *DMA_init.dat* DMA setup instructions 
- *config.vhd* Config package.

# Expected result #
The data defined in *SPM_init.dat* should have been sent to all nodes, thus the data printed by the traffic generators after the simulation is done should be identical for all nodes.

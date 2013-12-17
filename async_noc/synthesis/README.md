SYNTHESIS
==========
All synthesis has been run on ST65nm technolog using synopsys tools. For now the synthesis process is not included in the make file due to the custom settings needed for the synthesis environment.

To get the synthesis started create a working directory for synopsys according to your installation. A propper setup of the .synopsys_dc_setup file is expected, containing a reasonable definition of libraries for the choosen technology. Successfull synthesis has been achieved using the CORE65LPHVT & CORE65LPSVT libraries. 

Add a symlink to the scripts and netlists folder to your the working directory, start design_vision, and run the provided scripts in the following order:

`
source scripts/s0_readfiles.tcl  
source scripts/s1_setTimingConstraints.tcl
source scripts/s1b_setTimingConstraints.tcl  
source scripts/s2_compile.tcl  
source scripts/s3_reports.tcl
`



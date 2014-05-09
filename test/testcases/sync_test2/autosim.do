set NumericStdNoWarnings 1
view *
#view wave
do ../test/testcases/sync_test2/wave2.do
# limit the simulation run time
run 50 us
exit

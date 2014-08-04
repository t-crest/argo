#!/bin/sh
# Buildbot script, running the test cases for buildbot
# each testcase runs an all-to-all communication through
# the network and verifies the transaction afterwards

if ! make sync_test2_auto; then 
	exit 1 
fi
if ! make async_test2_auto; then 
	exit 1 
fi
if ! make test_tiled_4x4_pipelined_auto; then 
	exit 1 
fi

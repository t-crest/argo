.PHONY: schedule
all: schedule

schedule: all_to_all_swap.sched all_to_all_noswap.sched

all_to_all_swap.sched: sched.xml
	poseidon-conv sched.xml all_to_all_swap.sched Source-Phase-ASIC-text 3

all_to_all_noswap.sched: sched.xml
	poseidon-conv sched.xml all_to_all_noswap.sched Source-Phase-text 3

all_to_all_2.sched: sched.xml
	poseidon-conv sched.xml all_to_all_2.sched Source-Phase-text 2

sched.xml: bitorus4x4_p3.xml
	poseidon -m GREEDY -p bitorus4x4_p3.xml -s sched.xml

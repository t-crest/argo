.PHONY: schedule
all: schedule
schedule: all_to_all.sched
all_to_all.sched: sched.xml
	poseidon-conv sched.xml all_to_all.sched Source-Phase-ASIC-text 3
sched.xml: bitorus4x4_p3.xml
	poseidon -m GREEDY -p bitorus4x4_p3.xml -s sched.xml

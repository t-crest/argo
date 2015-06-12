#12/06/15 [16:20]
- CCI tested synchronously on board in hijacked version of NA: success
- todo:
	1. Still need to clean up code
	2. Prep for merge back into cdc branch

#11/06/15 [17:06]
- OCP IO inserted into dma.
- Buffered design changed to a moore type design. Glitches occurred when changing MCmd.
- Still todo:
	1. Code still needs a bit of clean up. There are dead code remnants, and some naming conventions that needs updating.
	2. Needs to be tested using some different (hacked) clocks, ie. 180 phase shift.


#10/06/15 [16:15]
- OCP IO ported. Passes custom test bench.
- Still in phase HijackNA
- Still todo:
	1. Proper todo list.
	2. Clean all dependencies on custom packages
	3. Move CCI into NA

#09/06/15 [16:45]
Initila time plan done

#09/06/15 [16:15]
- Multicore platform (4 core) + toolchain running
- Bootstrap process proposal:
	1. Implement cdc in NI (src/ni/nAdapter). Fully synchrnous operation. Objective: Port existing code to t-crest platform + test if ported design behaves correctly.
	2. Move cdc from NI into standalone component. Fully synchronous. Objective: Integrate cdc into toolchain.
	3. Implement normal single source PLL to generate multiple clocks for "asynchronous" test. Objective: test if design still holds at rational clock relationships.
	4. Implement disassociated clocks.
- Still todo:
	1. Proper todo list, not associated with devlog
	2. Time table covering:
		a. Development
		b. Documentation
		c. Paper 

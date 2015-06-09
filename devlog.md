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

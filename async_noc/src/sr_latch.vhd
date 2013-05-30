library ieee;
use ieee.std_logic_1164.all;
use work.defs.all;


entity sr_latch is 
	generic (
		constant q_init : std_logic	-- The initial value of q
	);
	port(
		s  : in std_logic;		-- set, active high		
		r  : in std_logic;		-- reset, active high
		q  : out std_logic;		-- q
		qn : out std_logic		-- q inverted
	);
end sr_latch;


 architecture struct of sr_latch is
 	signal q_internal  : std_logic := q_init;
 	signal qn_internal : std_logic := not q_init;
 begin
 	q  <= q_internal;
 	qn <= qn_internal;

 	-- Classic double NOR
 	latch : process(r,s,q_internal,qn_internal) is
 	begin
 		q_internal  <= transport r nor qn_internal after delay;
 		qn_internal <= transport s nor q_internal after delay;
 	end process latch;
 end struct;


-- architecture struct of sr_latch is
-- 	signal q_internal, qn_internal : std_logic;
-- begin
-- 	q  <= q_internal;
-- 	qn <= qn_internal;

-- 	-- This behavioral approach is easier for XST to recognize than a double NOR
-- 	-- However two separate latches will be inferred
-- 	latch : process (s, r) begin
-- 		if (r='1' and s='0') then		-- Reset
-- 			q_internal  <= '0';
-- 			qn_internal <= '1';
-- 		elsif (r='0' and s='1') then	-- Set
-- 			q_internal  <= '1';
-- 			qn_internal <= '0';
-- 		elsif (r='1' and s='1') then	-- Set & Reset => invalid
-- 			q_internal  <= 'X';
-- 			qn_internal <= 'X';
-- 		end if;
-- 	end process latch;
-- end struct;


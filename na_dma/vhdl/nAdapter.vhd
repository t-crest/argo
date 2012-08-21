library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.defs.all;


entity nAdapter is

port (
-- General
	na_clk		: in  std_logic;
	na_reset	: in  std_logic;

-- Processor Ports
-- DMA Configuration Port - OCP
	proc_in		: in ocp_master;
	proc_out	: out ocp_slave;
	     
-- SPM Data Port - OCP?
	spm_in		: in ocp_slave_spm;
	spm_out		: out ocp_master_spm;

-- Network Ports
-- Incoming Port
	pkt_in		: in  network_link;

-- Outgoing Port
	pkt_out		: out network_link

);
end nAdapter;


architecture rtl of nAdapter is

-- Signals
signal slt_index	: std_logic_vector(SLT_WIDTH-1 downto 0);
signal sc_en		: std_logic;
signal slt_en		: std_logic;

signal config		: std_logic_vector(3 downto 0);
signal config_reg	: std_logic_vector(4 downto 0);

signal dma_index	: std_logic_vector(DMA_IND_WIDTH-1 downto 0);
signal dma_entry	: std_logic_vector(DMA_WIDTH-1 downto 0);
signal dma_entry_updated: std_logic_vector(DMA_WIDTH-1 downto 0);

signal dma_ren		: std_logic_vector(2 downto 0);
signal dma_wen		: std_logic_vector(2 downto 0);
signal dma_waddr	: std_logic_vector(DMA_IND_WIDTH-1 downto 0);
signal dma_wdata	: std_logic_vector(DMA_WIDTH-1 downto 0);
signal dma_raddr	: std_logic_vector(DMA_IND_WIDTH-1 downto 0);
signal dma_rdata	: std_logic_vector(DMA_WIDTH-1 downto 0);

signal dma_cnt		: unsigned(BLK_CNT-1 downto 0);
signal dma_cnt_new	: unsigned(BLK_CNT-1 downto 0);
signal dma_rp_new	: unsigned(SPM_ADDR_WIDTH-1 downto 0);
signal dma_wp_new	: unsigned(SPM_ADDR_WIDTH-1 downto 0);

signal dma_ctrl		: std_logic;
signal dma_ctrl_new	: std_logic_vector(1 downto 0);
signal done		: std_logic;
signal done_new		: std_logic;

signal state_cnt	: unsigned(1 downto 0);
signal val		: unsigned(1 downto 0);

signal dIn_h		: std_logic_vector(DATA_WIDTH-1 downto 0);
signal dOut_l		: std_logic_vector(DATA_WIDTH-1 downto 0);

signal address		: std_logic_vector(SPM_ADDR_WIDTH-1 downto 0);
signal m_cmd		: std_logic;

signal dOutreg_ld	: std_logic;
signal dInreg_ld	: std_logic;
signal adreg_ld		: std_logic;

--signal mux_sel		: std_logic_vector(1 downto 0);
signal mux_out		: std_logic_vector(DATA_WIDTH-1 downto 0);
signal hdr_phit		: std_logic_vector(DATA_WIDTH-1 downto 0);

signal phitOut		: std_logic_vector(PHIT_WIDTH-1 downto 0);
signal phitIn		: std_logic_vector(PHIT_WIDTH-1 downto 0);

signal pkt_ctrl		: std_logic;
signal dma_ctrl_reg	: std_logic;
signal ctrlOutreg_ld	: std_logic;

--signal slot_table : sltt_type := (others => (others => '0'));

-- Components
component counter
	generic (
		WIDTH	: integer
	);
	port (
		clk 	: in std_logic ;
		reset 	: in std_logic ;
		enable	: in std_logic;
		cnt 	: out std_logic_vector(WIDTH-1 downto 0)
	);
end component;

component dma_sdp
	generic (
		DATA		: integer := 64;
		ADDR		: integer := 2
	);
	port (
		clk		: in std_logic;
		reset		: in std_logic;

		ren		: in std_logic_vector(2 downto 0);
		wen	 	: in std_logic_vector(2 downto 0);
		waddr 		: in std_logic_vector(ADDR-1 downto 0);
		wdata	 	: in std_logic_vector(DATA-1 downto 0);
		raddr 		: in std_logic_vector(ADDR-1 downto 0);
		rdata		: out std_logic_vector(DATA-1 downto 0)
	);		
end component;

component bram
	generic (
		DATA    : integer := 32;
		ADDR    : integer := 14
	);

	port (
		clk 	: in std_logic ;
		rd_addr : in std_logic_vector(ADDR-1 downto 0);
		wr_addr : in std_logic_vector(ADDR-1 downto 0);
		wr_data : in std_logic_vector(DATA-1 downto 0);
		wr_ena 	: in std_logic ;
		rd_data : out std_logic_vector(DATA-1 downto 0)
	);
end component;



begin

-- component instantiations ------------------------------------------------------------
-- Slot Counter
	slt_cnt : counter
		generic map ( WIDTH=>SLT_WIDTH )
		port map ( clk=>na_clk, reset=>na_reset, enable=>sc_en, cnt=>slt_index );

-- DMA Table - simple block ram
	dma_table : dma_sdp
		generic map ( DATA=>DMA_WIDTH, ADDR=>DMA_IND_WIDTH )
		port map (clk=>na_clk, reset=>na_reset,
		 	ren => dma_ren,
			wen => dma_wen,
			waddr => dma_waddr,
			wdata => dma_wdata,
			raddr => dma_raddr,
			rdata => dma_rdata
		);


	slt_en <= '1' when config=ST_ACCESS and proc_in.MCmd(1)='1'
			else '0';
-- Slot Table
	slt_table : bram
		generic map ( DATA=>DMA_IND_WIDTH, ADDR=>SLT_WIDTH )
		port map (clk => na_clk,
			rd_addr => slt_index,
			wr_addr => proc_in.MAddr(SLT_WIDTH-1 downto 0),
			wr_data => proc_in.MData(DMA_IND_WIDTH-1 downto 0),
			wr_ena => slt_en,
			rd_data => dma_index
		);

--process(na_clk, na_reset) begin
--		if na_reset='1' then
--			dma_index <= (others=>'0');
--		elsif rising_edge(na_clk) then
--			dma_index <= slot_table(conv_integer(slt_index)) after PDELAY;
			--if config <= ST_ACCESS and proc_in.MCmd(1)='1' then
--			if slt_en = '1' then
--				slot_table(conv_integer(proc_in.MAddr(SLT_WIDTH-1 downto 0))) 
--					<= proc_in.MData(DMA_IND_WIDTH-1 downto 0);
--					<= proc_in.MData(OCP_DATA_WIDTH-1 downto OCP_DATA_WIDTH-8);
--				slot_table((to_integer(proc_in.MAddr(SLT_WIDTH-1 downto 0))+1) 
--					<= proc_in.MData(OCP_DATA_WIDTH-9 downto OCP_DATA_WIDTH-16);
--				slot_table((to_integer(proc_in.MAddr(SLT_WIDTH-1 downto 0))+2) 
--					<= proc_in.MData(OCP_DATA_WIDTH-17 downto OCP_DATA_WIDTH-24)
--				slot_table((to_integer(proc_in.MAddr(SLT_WIDTH-1 downto 0))+3) 
--					<= proc_in.MData(OCP_DATA_WIDTH-25 downto OCP_DATA_WIDTH-32);
--			end if;
--		end if;
--	end process;

-- configuration interface --------------------------------------------------------------------
-- decode inputs -------------------------------------
-- address map decoding
	ocp_decode : process (proc_in.MAddr) begin
		config <= CNULL;
		-- ST configuration
		if proc_in.MAddr(OCP_ADDR_WIDTH-1 downto OCP_ADDR_WIDTH-ADDR_MASK_W)=ST_MASK then
			config <= ST_ACCESS;
		-- DMA 3/route configuration
		elsif proc_in.MAddr(OCP_ADDR_WIDTH-1 downto OCP_ADDR_WIDTH-ADDR_MASK_W)=DMA_P_MASK then
			config <= DMA_R_ACCESS;
		-- DMA 1,2 configuration
		elsif proc_in.MAddr(OCP_ADDR_WIDTH-1 downto OCP_ADDR_WIDTH-ADDR_MASK_W)=DMA_MASK 
				and proc_in.MAddr(0)='0' then
			config <= DMA_H_ACCESS;
		elsif proc_in.MAddr(OCP_ADDR_WIDTH-1 downto OCP_ADDR_WIDTH-ADDR_MASK_W)=DMA_MASK 
				and proc_in.MAddr(0)='1' then
			config <= DMA_L_ACCESS;
		-- not configuration
		else
			config <= CNULL;
		end if;
	end process;


-- build outputs -------------------------------------
	-- ocp data response
	ocp_response : process ( state_cnt, config_reg, dma_rdata) begin
		proc_out.SData <= (others=>'0');
		proc_out.SResp <= '0';

		case state_cnt is
		when "00" =>
			--if config_reg=('0' & ST_ACCESS) then
			--	proc_out.SData <= "000000000000000000000000000000" & dma_index;
			--	proc_out.SResp <= '1';
			if config_reg=('0' & DMA_R_ACCESS) or config_reg=('0' & DMA_H_ACCESS) or config_reg=('0' & DMA_L_ACCESS) then
				proc_out.SData <= dma_rdata(OCP_DATA_WIDTH-1 downto 0);
				proc_out.SResp <= '1';
			--else
			--	proc_out.SData <= (others=>'0');
			--	proc_out.SResp <= '0';
			end if;
		when "01" =>
			--if config_reg=('0' & ST_ACCESS) then
			--	proc_out.SData <= "000000000000000000000000000000" & dma_index;
			--	proc_out.SResp <= '1';
			if config_reg=('0' & DMA_R_ACCESS) or config_reg=('0' & DMA_H_ACCESS) or config_reg=('0' & DMA_L_ACCESS) then
				proc_out.SData <= dma_rdata(OCP_DATA_WIDTH-1 downto 0);
				proc_out.SResp <= '1';
			end if;
		when others =>
			proc_out.SData <= (others=>'0');
			proc_out.SResp <= '0';
		end case;
	end process;



-- SPM interface ------------------------------------------------------------------------------
--- construct SPM interface signals -->ocp???
	spm_interface : process (state_cnt, pkt_ctrl, dma_entry, address) begin
		if state_cnt = "00" and pkt_ctrl = '1' then
			spm_out.MCmd <= "11";
			spm_out.MAddr <= x"0000" & address;
		else 			
			spm_out.MCmd <= "00";
			spm_out.MAddr <= x"0000" & dma_entry(47 downto 32);
		end if;
	end process;
	spm_out.MData(SPM_DATA_WIDTH-1 downto DATA_WIDTH) <= dIn_h;
	spm_out.MData(DATA_WIDTH-1 downto 0) <= phitIn(DATA_WIDTH-1 downto 0);

-- network interface -------------------------------------------------------------------------
-- input pkt control-------------------------------
-- decode incoming packet --TODO:check if control bits -if pkt is valid
	pkt_ctrl <= phitIn(PHIT_WIDTH-1) or phitIn(PHIT_WIDTH-2) or phitIn(PHIT_WIDTH-3);


-- output pkt construction---------------------------
-- build hdr phit
	hdr_phit <= dma_entry(DATA_WIDTH-1 downto 0);

-- mux to choose outgoing data
	nout_select : process(state_cnt, dma_ctrl, dma_ctrl_reg, hdr_phit, spm_in.SData(63 downto 32), dOut_l) begin
		case state_cnt is
		when "00" =>
			if dma_ctrl_reg='1'then
				--mux on 1 (data1)
				mux_out <= spm_in.SData(63 downto 32) after PDELAY;
			else
				mux_out <= (others=>'0') after PDELAY;
			end if;
		when "01" =>
			if dma_ctrl_reg='1'then
				--mux on 2 (data2)
				mux_out <= dOut_l after PDELAY;
			else
				mux_out <= (others=>'0') after PDELAY;
			end if;
		when "10" =>
			if dma_ctrl='1' then
				--mux on 0 (hdr)
				mux_out <= hdr_phit after PDELAY;
			else
				mux_out <= (others=>'0') after PDELAY;
			end if;
		when others =>
			mux_out <= (others=>'0');
		end case;
	end process;	

-- build outgoing packet
	--control bits
	phitOut(PHIT_WIDTH-1) <= state_cnt(1) and dma_ctrl;	--hdr
	phitOut(PHIT_WIDTH-2) <= not (state_cnt(0) or state_cnt(1)) and dma_ctrl_reg;	--md
	phitOut(PHIT_WIDTH-3) <= state_cnt(0) and dma_ctrl_reg;	--eop
	--hdr or payload
	phitOut(PHIT_WIDTH-4 downto 0) <= mux_out;


-- DMA signals --------------------------------------------------------------------------------
	dma_state_control : process (state_cnt, config, proc_in, dma_ctrl, dma_index, dma_entry_updated, dma_rdata) begin
		dma_waddr <= (others => '0');
		dma_wdata <= (others => '0');
		dma_wen <= (others => '0');
		dma_raddr <= (others => '0');
		dma_ren <= (others => '0');
		proc_out.SCmdAccept <= '0';
		dma_entry <= (others => '0');

		case state_cnt is
		when "00" =>
			-- configuration write
			if proc_in.MCmd(0)='1' then
				if config=DMA_R_ACCESS then
					dma_waddr <= proc_in.MAddr(DMA_IND_WIDTH-1 downto 0);
					dma_wdata <= x"00000000" & proc_in.MData;
					dma_wen <= config(2 downto 0);
					proc_out.SCmdAccept <= '1';
				elsif config=DMA_H_ACCESS then
					dma_waddr <= proc_in.MAddr(DMA_IND_WIDTH downto 1);
					dma_wdata <= proc_in.MData(BANK0_W-1 downto 0) & x"000000000000";
					dma_wen <= config(2 downto 0);
					proc_out.SCmdAccept <= '1';
				elsif config=DMA_L_ACCESS then
					dma_waddr <= proc_in.MAddr(DMA_IND_WIDTH downto 1);
					dma_wdata <= x"0000" & proc_in.MData & x"0000";
					dma_wen <= config(2 downto 0);
					proc_out.SCmdAccept <= '1';
				else
					dma_waddr <= (others => '0');
					dma_wdata <= (others => '0');
					dma_wen <= (others => '0');
					proc_out.SCmdAccept <= '0';
				end if;
			--configuration read or no read
			else
				if config=DMA_R_ACCESS then
					dma_raddr <= proc_in.MAddr(DMA_IND_WIDTH-1 downto 0);
					dma_ren <= config(2 downto 0);
					--build ocp slave signals
					proc_out.SCmdAccept <= '1';
				elsif config=DMA_H_ACCESS or config=DMA_L_ACCESS then
					dma_raddr <= proc_in.MAddr(DMA_IND_WIDTH downto 1);
					dma_ren <= config(2 downto 0);
					--build ocp read data
					proc_out.SCmdAccept <= '1';
				--elsif config=ST_MASK
				else
					dma_waddr <= (others => '0');
					dma_wdata <= (others => '0');
					dma_wen <= (others => '0');
					--build ocp read data
					proc_out.SCmdAccept <= '0';
				end if;					
			end if;
			
		when "01" =>
			if proc_in.MCmd(0)='1' then
				if config=DMA_R_ACCESS then
					dma_waddr <= proc_in.MAddr(DMA_IND_WIDTH-1 downto 0);
					dma_wdata <= x"00000000" & proc_in.MData;
					dma_wen <= config(2 downto 0);
					proc_out.SCmdAccept <= '1';					
				elsif config=DMA_H_ACCESS then 
					dma_waddr <= proc_in.MAddr(DMA_IND_WIDTH downto 1);
					dma_wdata <= proc_in.MData(BANK0_W-1 downto 0) & x"000000000000";
					dma_wen <= config(2 downto 0);
					proc_out.SCmdAccept <= '1';
				elsif config=DMA_L_ACCESS then
					dma_waddr <= proc_in.MAddr(DMA_IND_WIDTH downto 1);
					dma_wdata <= x"0000" & proc_in.MData & x"0000";
					dma_wen <= config(2 downto 0);
					proc_out.SCmdAccept <= '1';
				else
					dma_waddr <= (others => '0');
					dma_wdata <= (others => '0');
					dma_wen <= (others => '0');
					proc_out.SCmdAccept <= '0';
				end if;
			end if;
			dma_raddr <= dma_index;
			dma_ren <= "111";

		when "10" =>
			dma_waddr <= dma_index;
			dma_wdata <= dma_entry_updated;
			if dma_ctrl='1' then
				dma_wen <= "110";
			else
				dma_wen <= "000";
			end if;

			if proc_in.MCmd(0)='0' then
				if config=DMA_R_ACCESS then
					dma_raddr <= proc_in.MAddr(DMA_IND_WIDTH-1 downto 0);
					dma_ren <= config(2 downto 0);
					proc_out.SCmdAccept <= '1';
				elsif config=DMA_H_ACCESS or config=DMA_L_ACCESS then
					dma_raddr <= proc_in.MAddr(DMA_IND_WIDTH downto 1);
					dma_ren <= config(2 downto 0);
					proc_out.SCmdAccept <= '1';
				else
					dma_raddr <= (others => '0');
					dma_ren <= (others => '0');
					proc_out.SCmdAccept <= '0';
				--elsif config=ST_MASK
				end if;
			end if;	

			dma_entry <= dma_rdata;
		
		when others =>
			dma_waddr <= (others => '0');
			dma_wdata <= (others => '0');
			dma_wen <= (others => '0');
			dma_raddr <= (others => '0');
			dma_ren <= (others => '0');
			proc_out.SCmdAccept <= '0';
		end case;
	end process;


-- DMA control 0 decode dma entry
	--valid dma entry and transfer not done yet
	dma_ctrl <= dma_entry(DMA_WIDTH-1) and (not dma_entry(DMA_WIDTH-2));	--reg this?
	dma_cnt <= unsigned(dma_entry(61 downto 48));

-- update dma entry fields
	dma_cnt_new <= dma_cnt - 1;
	dma_rp_new <= unsigned(dma_entry(47 downto 32)) + 1;
	dma_wp_new <= unsigned(dma_entry(31 downto 16)) + 1;

	done <= '1' when dma_cnt_new=0
		else '0';
	done_new <= dma_entry(DMA_WIDTH-1) and done;
	dma_ctrl_new <= dma_entry(DMA_WIDTH-1) & done_new;

-- updated dma entry
	dma_entry_updated <= (dma_ctrl_new & 
				std_logic_vector(dma_cnt_new) & 
				std_logic_vector(dma_rp_new) & 
				std_logic_vector(dma_wp_new) & 
				dma_entry(15 downto 0)) when dma_ctrl='1' else
				dma_entry;
	


-- control FSM - just counter --------------------------------------------------------------------
	val <= state_cnt + 1;
	process (na_reset, na_clk)
	begin 
		if na_reset='1' then
			state_cnt <= (others=>'0') after PDELAY;
		elsif rising_edge(na_clk) then
			if state_cnt="10" then
				state_cnt <= (others=>'0') after PDELAY;
			else
				state_cnt <= val after PDELAY;
			end if;
		end if;
	end process;

	reg_control : process(state_cnt)
	begin	
	dOutreg_ld <= '0';
	adreg_ld <= '0';
	dInreg_ld <= '0';
	ctrlOutreg_ld <= '0';
	sc_en <= '0';

	if state_cnt="00" then
		--ld dataOut_reg
		dOutreg_ld <= '1';
	elsif state_cnt="01" then
		--read slot_table
		--read DMA
		--decode 
		--ld addr_reg
		adreg_ld <= '1';
	elsif state_cnt="10" then
		--read SPM	==OCP????
		--load dataIn_reg
		dInreg_ld <= '1';
		ctrlOutreg_ld <='1';
		--update slt_cnt
		sc_en <= '1';
	else
		dOutreg_ld <= '0';
		adreg_ld <= '0';
		dInreg_ld <= '0';
		ctrlOutreg_ld <= '0';
		sc_en <= '0';

	end if;

	end process;


-- registers --------------------------------------------------------------------------------------
	registers : process(na_clk, na_reset) begin
		if na_reset='1' then
			dma_ctrl_reg <= '0' after PDELAY;
			address <= (others=>'0') after PDELAY;
			dIn_h <= (others=>'0') after PDELAY;
			dOut_l <= (others=>'0') after PDELAY;
			phitIn <= (others=>'0') after PDELAY;
			pkt_out.phit <= (others=>'0') after PDELAY;
			config_reg <= (others=>'0');

		elsif rising_edge(na_clk) then
			if ctrlOutreg_ld='1' then
				dma_ctrl_reg <= dma_ctrl after PDELAY;
			end if;
			if adreg_ld='1' then
				address <= phitIn(31 downto 16) after PDELAY;
			end if;
			if dInreg_ld='1' then
				dIn_h <= phitIn(DATA_WIDTH-1 downto 0) after PDELAY;
			end if;
			if dOutreg_ld='1' then
				dOut_l <= spm_in.SData(DATA_WIDTH-1 downto 0) after PDELAY;
			end if;
			phitIn <= pkt_in.phit after PDELAY;
			pkt_out.phit <= phitOut after PDELAY;
			config_reg <= proc_in.MCmd(1) & config;

		end if;
	end process;


	

 
end rtl;


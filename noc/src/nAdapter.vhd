-- 
-- Copyright Technical University of Denmark. All rights reserved.
-- This file is part of the T-CREST project.
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
-- 
--    1. Redistributions of source code must retain the above copyright notice,
--       this list of conditions and the following disclaimer.
-- 
--    2. Redistributions in binary form must reproduce the above copyright
--       notice, this list of conditions and the following disclaimer in the
--       documentation and/or other materials provided with the distribution.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER ``AS IS'' AND ANY EXPRESS
-- OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
-- OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
-- NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
-- THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 
-- The views and conclusions contained in the software and documentation are
-- those of the authors and should not be interpreted as representing official
-- policies, either expressed or implied, of the copyright holder.
-- 


--------------------------------------------------------------------------------
-- Network Adaptor (NI) for the TDM NoC with DMAs.
--
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------

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


------------------------------ signal declarations --------------------------------
signal slt_index	: std_logic_vector(SLT_WIDTH-1 downto 0);
signal sc_en		: std_logic;
signal slt_en		: std_logic;

signal slt_entry	: std_logic_vector(DMA_IND_WIDTH downto 0);
signal vld_slt		: std_logic;

signal config		: std_logic_vector(3 downto 0);
signal config_reg	: std_logic_vector(4 downto 0);

signal ocp_cmd_valid	: std_logic;
signal ocp_cmd_read	: std_logic;
signal ocp_cmd_write	: std_logic;

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

signal mux_out		: std_logic_vector(DATA_WIDTH-1 downto 0);
signal hdr_phit		: std_logic_vector(DATA_WIDTH-1 downto 0);

signal phitOut		: std_logic_vector(PHIT_WIDTH-1 downto 0);
signal phitIn		: std_logic_vector(PHIT_WIDTH-1 downto 0);

signal pkt_ctrl		: std_logic;
signal dma_ctrl_reg	: std_logic;
signal ctrlOutreg_ld	: std_logic;


-------------------------------- Components declarations --------------------------------
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


	slt_en <= '1' when config=ST_ACCESS and ocp_cmd_write='1'--proc_in.MCmd(0)='1'
			else '0';
-- Slot Table
	slt_table : bram
		generic map ( DATA=>DMA_IND_WIDTH+1, ADDR=>SLT_WIDTH )
		port map (clk => na_clk,
			rd_addr => slt_index,
			wr_addr => proc_in.MAddr(SLT_WIDTH-1 downto 0),
			wr_data => proc_in.MData(DMA_IND_WIDTH downto 0),
			wr_ena => slt_en,
			rd_data => slt_entry
		);

	dma_index <= slt_entry(DMA_IND_WIDTH-1 downto 0);
	vld_slt <= slt_entry(DMA_IND_WIDTH);

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

-- ocp command decoding
	ocp_cmd_valid <= '1' when proc_in.MCmd="000" else '0';
	ocp_cmd_read <= '1' when proc_in.MCmd="010" else '0';
	ocp_cmd_write <= '1' when proc_in.MCmd="001" else '0';

-- build outputs -------------------------------------
	-- ocp data response
	ocp_response : process ( state_cnt, config_reg, dma_rdata) begin
		proc_out.SData <= (others=>'0');
		proc_out.SResp <= '0';

		case state_cnt is
		when "00" =>
			if config_reg=('1' & DMA_R_ACCESS) or config_reg=('1' & DMA_H_ACCESS) or config_reg=('1' & DMA_L_ACCESS) then
				proc_out.SData <= dma_rdata(OCP_DATA_WIDTH-1 downto 0);
				proc_out.SResp <= '1';
			end if;
		when "01" =>
			if config_reg=('1' & DMA_R_ACCESS) or config_reg=('1' & DMA_H_ACCESS) or config_reg=('1' & DMA_L_ACCESS) then
				proc_out.SData <= dma_rdata(OCP_DATA_WIDTH-1 downto 0);
				proc_out.SResp <= '1';
			end if;
		when others =>
			proc_out.SData <= (others=>'0');
			proc_out.SResp <= '0';
		end case;
	end process;



-- SPM interface ------------------------------------------------------------------------------
--- construct SPM interface signals --ocp
	spm_interface : process (state_cnt, pkt_ctrl, dma_entry, address) begin
		if state_cnt = "00" and pkt_ctrl = '1' then
			spm_out.MCmd <= "001"; --write
			spm_out.MAddr <= std_logic_vector(to_unsigned(0,OCP_ADDR_WIDTH-(SPM_ADDR_WIDTH-1))) & address(SPM_ADDR_WIDTH-1 downto 1);
		else 			
			spm_out.MCmd <= "010"; --read
			spm_out.MAddr <= x"0000" & '0' & dma_entry(47 downto 33);
		end if;
	end process;
	spm_out.MData(SPM_DATA_WIDTH-1 downto DATA_WIDTH) <= dIn_h;
	spm_out.MData(DATA_WIDTH-1 downto 0) <= phitIn(DATA_WIDTH-1 downto 0);

-- network interface -------------------------------------------------------------------------
-- input pkt control-------------------------------
-- decode incoming packet 
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
			--if proc_in.MCmd(0)='1' then
			if ocp_cmd_write='1' then
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
				elsif config=ST_ACCESS then
					dma_waddr <= (others => '0');
					dma_wdata <= (others => '0');
					dma_wen <= (others => '0');
					proc_out.SCmdAccept <= '1';
				else
					dma_waddr <= (others => '0');
					dma_wdata <= (others => '0');
					dma_wen <= (others => '0');
					dma_raddr <= (others => '0');
					dma_ren <= (others => '0');
					proc_out.SCmdAccept <= '0';
				end if;
			--configuration read or no read
			elsif ocp_cmd_read='1' then
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
				else
					dma_waddr <= (others => '0');
					dma_wdata <= (others => '0');
					dma_wen <= (others => '0');
					dma_raddr <= (others => '0');
					dma_ren <= (others => '0');
					proc_out.SCmdAccept <= '0';
				end if;
			else
				dma_waddr <= (others => '0');
				dma_wdata <= (others => '0');
				dma_wen <= (others => '0');
				dma_raddr <= (others => '0');
				dma_ren <= (others => '0');
				proc_out.SCmdAccept <= '0';
			end if;
			
		when "01" =>
			--if proc_in.MCmd(0)='1' then
			if ocp_cmd_write='1' then
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
				elsif config=ST_ACCESS then
					dma_waddr <= (others => '0');
					dma_wdata <= (others => '0');
					dma_wen <= (others => '0');
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

			--if proc_in.MCmd(0)='0' then
			if ocp_cmd_read='1' then
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
				end if;
			else
				dma_raddr <= (others => '0');
				dma_ren <= (others => '0');
				proc_out.SCmdAccept <= '0';

			end if;	

			if vld_slt='1' then
				dma_entry <= dma_rdata;
			else
				dma_entry <= (others=>'0');
			end if;
		
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
	dma_ctrl <= dma_entry(DMA_WIDTH-1) and (not dma_entry(DMA_WIDTH-2));
	dma_cnt <= unsigned(dma_entry(61 downto 48));

-- update dma entry fields
	dma_cnt_new <= dma_cnt - 2;
	dma_rp_new <= unsigned(dma_entry(SPM_ADDR_WIDTH-1+32 downto 32)) + 2;
	dma_wp_new <= unsigned(dma_entry(SPM_ADDR_WIDTH-1+16 downto 16)) + 2;

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
		--ld addr_reg
		adreg_ld <= '1';
	elsif state_cnt="10" then
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
			pkt_out <= (others=>'0') after PDELAY;
			config_reg <= (others=>'0');

		elsif rising_edge(na_clk) then
			if ctrlOutreg_ld='1' then
				dma_ctrl_reg <= dma_ctrl after PDELAY;
			end if;
			if adreg_ld='1' then
				address <= phitIn(SPM_ADDR_WIDTH-1+16 downto 16) after PDELAY;
			end if;
			if dInreg_ld='1' then
				dIn_h <= phitIn(DATA_WIDTH-1 downto 0) after PDELAY;
			end if;
			if dOutreg_ld='1' then
				dOut_l <= spm_in.SData(DATA_WIDTH-1 downto 0) after PDELAY;
			end if;
			phitIn <= pkt_in after PDELAY;
			pkt_out <= phitOut after PDELAY;
			--config_reg <= proc_in.MCmd(1) & config;
			config_reg <= ocp_cmd_valid & config;

		end if;
	end process;


	

 
end rtl;


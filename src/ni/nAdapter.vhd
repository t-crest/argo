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
use work.config.all;
use work.noc_defs.all;
use work.noc_interface.all;
use work.ocp.all;


entity nAdapter is

port (
-- General
	na_clk		: in  std_logic;
	na_reset	: in  std_logic;

-- Processor Ports
-- DMA Configuration Port - OCP
	proc_in		: in ocp_io_m;
	proc_out	: out ocp_io_s;
 

-- SPM Data Port - OCP?
	spm_in		: in spm_slave;
	spm_out		: out spm_master;

-- Network Ports
-- Incoming Port
	pkt_in		: in  link_t;

-- Outgoing Port
	pkt_out		: out link_t

);
end nAdapter;


architecture rtl of nAdapter is


------------------------------ signal declarations --------------------------------
signal slt_index	: std_logic_vector(ADDR_SLT_WIDTH-1 downto 0);
signal sc_en		: std_logic;
signal slt_en		: std_logic;

signal slt_entry	: std_logic_vector(DMA_IND_WIDTH+2 downto 0);
signal vld_slt		: std_logic;

signal phase_prev       : std_logic_vector(1 downto 0);
signal phase_next       : std_logic_vector(1 downto 0);
signal phase_ld         : std_logic;
signal pkt_out_sel      : std_logic_vector(1 downto 0);

signal config		: std_logic_vector(3 downto 0);
signal config_reg	: std_logic_vector(4 downto 0);
signal read_cmd_reg	: std_logic;

signal ocp_cmd_valid	: std_logic;
signal ocp_cmd_read	: std_logic;
signal ocp_cmd_write	: std_logic;

signal response_ld_control : std_logic;
signal ocp_read_control : std_logic;
signal ocp_write_control : std_logic;
signal ocp_dataresp	: std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
signal ocp_response	: std_logic_vector(OCP_RESP_WIDTH-1 downto 0);
signal resp_ld		: std_logic;
signal ocp_dataresp_reg : std_logic_vector(OCP_DATA_WIDTH-1 downto 0);
signal ocp_response_reg : std_logic_vector(OCP_RESP_WIDTH-1 downto 0);


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
signal dma_rp_new	: unsigned(SPM_ADDR_WIDTH_MAX-1 downto 0);
signal dma_wp_new	: unsigned(SPM_ADDR_WIDTH_MAX-1 downto 0);

signal dma_ctrl		: std_logic;
signal dma_ctrl_new	: std_logic_vector(1 downto 0);
signal done		: std_logic;
signal done_new		: std_logic;

signal state_cnt	: unsigned(1 downto 0);
signal val		: unsigned(1 downto 0);

signal dIn_h		: std_logic_vector(DATA_WIDTH-1 downto 0);
signal dOut_l		: std_logic_vector(DATA_WIDTH-1 downto 0);

signal address		: std_logic_vector(SPM_ADDR_WIDTH-1 downto 0);  -- SPM_ADDR_WIDTH+1 bits
                                                                      -- due to word addressing in packets
signal m_cmd		: std_logic;
signal flit_buf         : std_logic_vector(2*DATA_WIDTH+SPM_ADDR_WIDTH-1 downto 0);  -- SPM_ADDR_WIDTH+1 bits
                                                                      -- due to word addressing in packets
signal vld_buf          : std_logic;
signal vld_buf_ld       : std_logic;

signal dOutreg_ld	: std_logic;

signal mux_out		: std_logic_vector(DATA_WIDTH-1 downto 0);
signal hdr_phit		: std_logic_vector(DATA_WIDTH-1 downto 0);

signal phitIn		: std_logic_vector(LINK_WIDTH-1 downto 0);
signal phitOut0		: std_logic_vector(LINK_WIDTH-1 downto 0);
signal phitOut1         : std_logic_vector(LINK_WIDTH-1 downto 0);
signal phitOut2         : std_logic_vector(LINK_WIDTH-1 downto 0);

signal phit_togo        : std_logic_vector(LINK_WIDTH-1 downto 0);

signal vld_pkt		: std_logic;
signal dma_ctrl_reg	: std_logic;
signal ctrlOutreg_ld	: std_logic;

signal sop              : std_logic;
signal mop              : std_logic;
signal eop              : std_logic;
signal clear_buf        : std_logic;

---Temporary for sync test---

signal 	proc_in_synchronized	: ocp_io_m; --proc_in	: in ocp_io_m;
signal	proc_out_synchronized	: ocp_io_s;	--	proc_out	: out ocp_io_s;
 




-------------------------------
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

component bram is
  generic (
    DATA : integer;
    ADDR : integer);
  port (
    clk	    : in  std_logic;
    reset   : in  std_logic;
    rd_addr : in  std_logic_vector(ADDR-1 downto 0);
    wr_addr : in  std_logic_vector(ADDR-1 downto 0);
    wr_data : in  std_logic_vector(DATA-1 downto 0);
    wr_ena  : in  std_logic;
    rd_data : out std_logic_vector(DATA-1 downto 0));
end component bram;

begin

-- component instantiations ------------------------------------------------------------

---Temporary for sync test---

--Map input signal onto synchronized signal until cci has been implemented
proc_in_synchronized <= proc_in;
proc_out <= proc_out_synchronized;



-----------------------------


-- Slot Counter
	slt_cnt : counter
		generic map ( WIDTH=>ADDR_SLT_WIDTH )
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


	slt_en <= '1' when config=ST_ACCESS and ocp_cmd_write='1'--proc_in_synchronized.MCmd(0)='1'
			else '0';
-- Slot Table
	slt_table : bram
		generic map ( DATA=>DMA_IND_WIDTH+3, ADDR=>ADDR_SLT_WIDTH )
		port map (clk => na_clk,
                        reset => na_reset,
			rd_addr => slt_index,
			wr_addr => proc_in_synchronized.MAddr(ADDR_SLT_WIDTH+1 downto 2),
			wr_data => proc_in_synchronized.MData(DMA_IND_WIDTH+2 downto 0),
			wr_ena => slt_en,
			rd_data => slt_entry
		);

	dma_index <= slt_entry(DMA_IND_WIDTH+1 downto 2);
	vld_slt <= slt_entry(DMA_IND_WIDTH+2);
        --phase_delay <= slt_entry(1 downto 0);

-- configuration interface --------------------------------------------------------------------
-- decode inputs -------------------------------------
-- address map decoding
	ocp_decode : process (proc_in_synchronized.MAddr) begin
		config <= CNULL;
		-- ST configuration
		if proc_in_synchronized.MAddr(OCP_ADDR_WIDTH-1 downto OCP_ADDR_WIDTH-ADDR_MASK_W)=ST_MASK then
			config <= ST_ACCESS;
		-- DMA 3/route configuration
		elsif proc_in_synchronized.MAddr(OCP_ADDR_WIDTH-1 downto OCP_ADDR_WIDTH-ADDR_MASK_W)=DMA_P_MASK then
			config <= DMA_R_ACCESS;
		-- DMA 1,2 configuration
		elsif proc_in_synchronized.MAddr(OCP_ADDR_WIDTH-1 downto OCP_ADDR_WIDTH-ADDR_MASK_W)=DMA_MASK
				and proc_in_synchronized.MAddr(2)='0' then
			config <= DMA_H_ACCESS;
		elsif proc_in_synchronized.MAddr(OCP_ADDR_WIDTH-1 downto OCP_ADDR_WIDTH-ADDR_MASK_W)=DMA_MASK
				and proc_in_synchronized.MAddr(2)='1' then
			config <= DMA_L_ACCESS;
		-- not configuration
		else
			config <= CNULL;
		end if;
	end process;

-- ocp command decoding
	ocp_cmd_valid <= '0' when proc_in_synchronized.MCmd="000" else '1';
	ocp_cmd_read <= '1' when proc_in_synchronized.MCmd="010" else '0';
	ocp_cmd_write <= '1' when proc_in_synchronized.MCmd="001" else '0';

-- build outputs -------------------------------------

	ocp_read_control <= '1' when (state_cnt="00" or state_cnt="01") and (config_reg=('1' & DMA_R_ACCESS) or config_reg=('1' & DMA_H_ACCESS) or config_reg=('1' & DMA_L_ACCESS)) and read_cmd_reg='1' else '0';
	ocp_write_control <= '1' when (((state_cnt="00" or state_cnt="01") and (config=DMA_R_ACCESS or config=DMA_H_ACCESS or config=DMA_L_ACCESS or config=ST_ACCESS)) or (state_cnt="10" and config=ST_ACCESS)) and ocp_cmd_write='1' else '0';
	resp_ld <= '1' when (ocp_read_control='1' or ocp_write_control='1' or proc_in_synchronized.MRespAccept='1') else '0';

	response_ld_control <= '1' when ((ocp_read_control='1' or ocp_write_control='1') and proc_in_synchronized.MRespAccept='0') else '0';

	response_ld : process (response_ld_control, dma_rdata) begin
		ocp_dataresp <= (others=>'0');
		ocp_response <= OCP_RESP_NULL;

		case response_ld_control is
		when '1' =>
			ocp_dataresp <= dma_rdata(OCP_DATA_WIDTH-1 downto 0);
			ocp_response <= OCP_RESP_DVA;
		when others =>
			ocp_dataresp <= (others=>'0');
			ocp_response <= OCP_RESP_NULL;
		end case;
	end process;


	-- ocp data response
	ocp_response_output : process ( ocp_read_control, ocp_write_control, dma_rdata, ocp_dataresp_reg, ocp_response_reg ) begin
		proc_out_synchronized.SData <= (others=>'0');
		proc_out_synchronized.SResp <= OCP_RESP_NULL;

		case ocp_read_control is
		when '1' =>
			proc_out_synchronized.SData <= dma_rdata(OCP_DATA_WIDTH-1 downto 0);
		when others =>
			proc_out_synchronized.SData <= ocp_dataresp_reg;
		end case;

		case( ocp_read_control or ocp_write_control ) is
		when '1' =>
			proc_out_synchronized.SResp <= OCP_RESP_DVA;
		when others =>
			proc_out_synchronized.SResp <= ocp_response_reg;
		end case ;


	end process;



--	-- ocp data response
--	ocp_response : process ( state_cnt, config_reg, dma_rdata) begin
--		proc_out_synchronized.SData <= (others=>'0');
--		proc_out_synchronized.SResp <= '0';
--
--		case state_cnt is
--		when "00" =>
--			if config_reg=('1' & DMA_R_ACCESS) or config_reg=('1' & DMA_H_ACCESS) or config_reg=('1' & DMA_L_ACCESS) then
--				proc_out_synchronized.SData <= dma_rdata(OCP_DATA_WIDTH-1 downto 0);
--				proc_out_synchronized.SResp <= '1';
--			end if;
--		when "01" =>
--			if config_reg=('1' & DMA_R_ACCESS) or config_reg=('1' & DMA_H_ACCESS) or config_reg=('1' & DMA_L_ACCESS) then
--				proc_out_synchronized.SData <= dma_rdata(OCP_DATA_WIDTH-1 downto 0);
--				proc_out_synchronized.SResp <= '1';
--			end if;
--		when others =>
--			proc_out_synchronized.SData <= (others=>'0');
--			proc_out_synchronized.SResp <= '0';
--		end case;
--	end process;



-- SPM interface ------------------------------------------------------------------------------
--- construct SPM interface signals -->ocp???
	spm_interface : process (na_reset, state_cnt, dma_entry, flit_buf, vld_buf) begin
        if na_reset='1' then
            spm_out.MCmd <= "0";
			spm_out.MAddr <= (others=>'0');

		elsif state_cnt = "00" and vld_buf = '1' then
			spm_out.MCmd <= "1";
			spm_out.MAddr <= --std_logic_vector(to_unsigned(0,OCP_ADDR_WIDTH-SPM_ADDR_WIDTH+1))
                                         flit_buf(2*DATA_WIDTH+SPM_ADDR_WIDTH-1 downto 2*DATA_WIDTH);--address(SPM_ADDR_WIDTH-1 downto 1);
		else
			spm_out.MCmd <= "0";
			spm_out.MAddr <= dma_entry(32+SPM_ADDR_WIDTH-1 downto 32);--x"0000" & '0' & dma_entry(47 downto 33);
		end if;
	end process;
	spm_out.MData(2*DATA_WIDTH-1 downto 0) <= flit_buf(2*DATA_WIDTH-1 downto 0);--dIn_h;
	--spm_out.MData(DATA_WIDTH-1 downto 0) <= flit_buf(); --phitIn(DATA_WIDTH-1 downto 0);

-- network interface -------------------------------------------------------------------------
-- input pkt control-------------------------------
-- decode incoming packet
        sop <= phitIn(LINK_WIDTH-1) and phitIn(LINK_WIDTH-2);
        mop <= phitIn(LINK_WIDTH-1) and (not phitIn(LINK_WIDTH-2)) and (not phitIn(LINK_WIDTH-3));
        eop <= phitIn(LINK_WIDTH-1) and (not phitIn(LINK_WIDTH-2)) and phitIn(LINK_WIDTH-3);


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
	--phitOut(LINK_WIDTH-1) <= state_cnt(1) and dma_ctrl;	--hdr
    phit_togo(LINK_WIDTH-1) <= (state_cnt(1) and dma_ctrl) or ((not state_cnt(1)) and dma_ctrl_reg);
	--phitOut(LINK_WIDTH-2) <= not (state_cnt(0) or state_cnt(1)) and dma_ctrl_reg;	--md
    phit_togo(LINK_WIDTH-2) <= state_cnt(1) and dma_ctrl;	--hdr
	phit_togo(LINK_WIDTH-3) <= state_cnt(0) and dma_ctrl_reg;	--eop
	--hdr or payload
	phit_togo(LINK_WIDTH-4 downto 0) <= mux_out;


        phase_delay_slection: process (state_cnt,phase_prev,phase_next)
        begin
          case state_cnt is

            when "00" =>

              if phase_prev="00" or phase_prev="11" then
                    if phase_next="00" then
                      pkt_out_sel <= "00";
                    else
                      pkt_out_sel <= "11";
                    end if;
              else
                    pkt_out_sel <= phase_prev;
              end if;

            when "01" =>

              if phase_prev="00" or phase_prev="01" or phase_prev="11" then
                    if phase_next="10" or phase_next="11" then
                      pkt_out_sel <= "11";
                    else
                      pkt_out_sel <= phase_next;
                    end if;
              else
                    pkt_out_sel <= phase_prev;
              end if;

            when "10" =>
              pkt_out_sel <= phase_next;

            when others =>
              pkt_out_sel <= "11";
          end case;
        end process;


        pkt_out_select: process (pkt_out_sel, phitOut0, phitOut1, phitOut2)
        begin  -- process pkt_out_sel
          case pkt_out_sel is
            when "00" =>
              pkt_out <= phitOut0;
            when "01" =>
              pkt_out <=phitOut1;
            when "10" =>
              pkt_out <=phitOut2;
            when others =>
              pkt_out <= (others=>'0');
          end case;
        end process;

-- DMA signals --------------------------------------------------------------------------------
	dma_state_control : process (state_cnt, config, ocp_cmd_write, ocp_cmd_read, proc_in_synchronized, dma_ctrl, dma_index, dma_entry_updated, dma_rdata, vld_slt) begin
		dma_waddr <= (others => '0');
		dma_wdata <= (others => '0');
		dma_wen <= (others => '0');
		dma_raddr <= (others => '0');
		dma_ren <= (others => '0');
		proc_out_synchronized.SCmdAccept <= '0';
		--dma_entry <= (others => '0');
		case state_cnt is
		when "00" =>
			-- configuration write
			--if proc_in_synchronized.MCmd(0)='1' then
			if ocp_cmd_write='1' then
				if config=DMA_R_ACCESS then
					dma_waddr <= proc_in_synchronized.MAddr(DMA_IND_WIDTH+1 downto 2);
					dma_wdata <= x"00000000" & proc_in_synchronized.MData;
					dma_wen <= config(2 downto 0);
					proc_out_synchronized.SCmdAccept <= '1';
				elsif config=DMA_H_ACCESS then
					dma_waddr <= proc_in_synchronized.MAddr(DMA_IND_WIDTH+2 downto 3);
					dma_wdata <= proc_in_synchronized.MData(BANK0_W-1 downto 0) & x"000000000000";
					dma_wen <= config(2 downto 0);
					proc_out_synchronized.SCmdAccept <= '1';
				elsif config=DMA_L_ACCESS then
					dma_waddr <= proc_in_synchronized.MAddr(DMA_IND_WIDTH+2 downto 3);
					dma_wdata <= x"0000" & proc_in_synchronized.MData & x"0000";
					dma_wen <= config(2 downto 0);
					proc_out_synchronized.SCmdAccept <= '1';
				elsif config=ST_ACCESS then
					proc_out_synchronized.SCmdAccept <= '1';
				end if;

			--configuration read or no read
			elsif ocp_cmd_read='1' then
				if config=DMA_R_ACCESS then
					dma_raddr <= proc_in_synchronized.MAddr(DMA_IND_WIDTH+1 downto 2);
					dma_ren <= config(2 downto 0);
					--build ocp slave signals
					proc_out_synchronized.SCmdAccept <= '1';
				elsif config=DMA_H_ACCESS or config=DMA_L_ACCESS then
					dma_raddr <= proc_in_synchronized.MAddr(DMA_IND_WIDTH+2 downto 3);
					dma_ren <= config(2 downto 0);
					--build ocp read data
					proc_out_synchronized.SCmdAccept <= '1';
				end if;
			end if;
			--dma_entry <= (others=>'0');

		when "01" =>
--			if proc_in_synchronized.MCmd(0)='1' then
			if ocp_cmd_write='1' then
				if config=DMA_R_ACCESS then
					dma_waddr <= proc_in_synchronized.MAddr(DMA_IND_WIDTH+1 downto 2);
					dma_wdata <= x"00000000" & proc_in_synchronized.MData;
					dma_wen <= config(2 downto 0);
					proc_out_synchronized.SCmdAccept <= '1';
				elsif config=DMA_H_ACCESS then
					dma_waddr <= proc_in_synchronized.MAddr(DMA_IND_WIDTH+2 downto 3);
					dma_wdata <= proc_in_synchronized.MData(BANK0_W-1 downto 0) & x"000000000000";
					dma_wen <= config(2 downto 0);
					proc_out_synchronized.SCmdAccept <= '1';
				elsif config=DMA_L_ACCESS then
					dma_waddr <= proc_in_synchronized.MAddr(DMA_IND_WIDTH+2 downto 3);
					dma_wdata <= x"0000" & proc_in_synchronized.MData & x"0000";
					dma_wen <= config(2 downto 0);
					proc_out_synchronized.SCmdAccept <= '1';
				elsif config=ST_ACCESS then
					proc_out_synchronized.SCmdAccept <= '1';
				end if;
			end if;
			dma_raddr <= dma_index;
			dma_ren <= "111";
                        --dma_entry <= (others=>'0');

		when "10" =>
			dma_waddr <= dma_index;
			dma_wdata <= dma_entry_updated;
			if dma_ctrl='1' then
				dma_wen <= "110";
			else
				dma_wen <= "000";
			end if;

			-- configuration read
			--if proc_in_synchronized.MCmd(0)='0' then
			if ocp_cmd_read='1' then
				if config=DMA_R_ACCESS then
					dma_raddr <= proc_in_synchronized.MAddr(DMA_IND_WIDTH+1 downto 2);
					dma_ren <= config(2 downto 0);
					proc_out_synchronized.SCmdAccept <= '1';
				elsif config=DMA_H_ACCESS or config=DMA_L_ACCESS then
					dma_raddr <= proc_in_synchronized.MAddr(DMA_IND_WIDTH+2 downto 3);
					dma_ren <= config(2 downto 0);
					proc_out_synchronized.SCmdAccept <= '1';
				end if;
			elsif ocp_cmd_write='1' and config=ST_ACCESS then
				proc_out_synchronized.SCmdAccept <= '1';
			end if;


                        --if  vld_slt='1' then
			--	dma_entry <= dma_rdata;
			--else
			--	dma_entry <= (others=>'0');
			--end if;

		when others =>
			dma_waddr <= (others => '0');
			dma_wdata <= (others => '0');
			dma_wen <= (others => '0');
			dma_raddr <= (others => '0');
			dma_ren <= (others => '0');
			proc_out_synchronized.SCmdAccept <= '0';
                 	--dma_entry <= (others => '0');

		end case;
            --end if;

	end process;

        dma_entry <= (others=>'0') when na_reset='1' else dma_rdata when (state_cnt="10" and vld_slt='1') else (others=>'0');

-- DMA control 0 decode dma entry
	--valid dma entry and transfer not done yet
	dma_ctrl <= dma_entry(DMA_WIDTH-1) and (not dma_entry(DMA_WIDTH-2));
	dma_cnt <= unsigned(dma_entry(61 downto 48));

-- update dma entry fields
	dma_cnt_new <= dma_cnt - 1;
	dma_rp_new <= unsigned(dma_entry(SPM_ADDR_WIDTH_MAX-1+32 downto 32)) + 1;
	dma_wp_new <= unsigned(dma_entry(SPM_ADDR_WIDTH_MAX-1+16 downto 16)) + 1;

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
	val <= (others=>'0') when state_cnt="10" else (state_cnt + 1) ;
	process (na_reset, na_clk)
	begin
		if na_reset='1' then
			state_cnt <= (others=>'0') after PDELAY;
		elsif rising_edge(na_clk) then
			state_cnt <= val after PDELAY;
		end if;
	end process;

	reg_control : process(state_cnt)
	begin
	dOutreg_ld <= '0';
    vld_buf_ld <= '0';
	ctrlOutreg_ld <= '0';
	sc_en <= '0';
    phase_ld <= '0';

	if state_cnt = "00" then
		dOutreg_ld <= '1';
        vld_buf_ld <= '1';
	elsif state_cnt="10" then
		ctrlOutreg_ld <='1';
        phase_ld <= '1';
		--update slt_cnt
		sc_en <= '1';
	else
		dOutreg_ld <= '0';
        vld_buf_ld <= '0';
		ctrlOutreg_ld <= '0';
		sc_en <= '0';
        phase_ld <= '0';
	end if;

	end process;


-- registers --------------------------------------------------------------------------------------
	registers : process(na_clk, na_reset) begin
		if na_reset='1' then
			dma_ctrl_reg <= '0';
			address <= (others=>'0');
			vld_pkt <= '0';
            dIn_h <= (others=>'0');
			dOut_l <= (others=>'0');
			phitIn <= (others=>'0');
            phitOut0 <= (others=>'0');
            phitOut1 <= (others=>'0');
            phitOut2 <= (others=>'0');
			config_reg <= (others=>'0');
            flit_buf <= (others=>'0');
            vld_buf <= '0';
            phase_prev <= (others=>'0');
            phase_next <= (others=>'0');
			ocp_dataresp_reg <= (others=>'0') after PDELAY;
			ocp_response_reg <= OCP_RESP_NULL after PDELAY;

		elsif rising_edge(na_clk) then
			if ctrlOutreg_ld='1' then
				dma_ctrl_reg <= dma_ctrl after PDELAY;
			end if;
            if dOutreg_ld='1' then
				dOut_l <= spm_in.SData(DATA_WIDTH-1 downto 0) after PDELAY;
			end if;


            if sop='1' then
				address <= phitIn(DATA_WIDTH-SPM_ADDR_WIDTH_MAX+SPM_ADDR_WIDTH-1 downto DATA_WIDTH-SPM_ADDR_WIDTH_MAX) after PDELAY;
                vld_pkt <= phitIn(LINK_WIDTH-1) after PDELAY;
			end if;
			if mop='1' then
				dIn_h <= phitIn(DATA_WIDTH-1 downto 0) after PDELAY;
			end if;
            if eop='1' then
                flit_buf <= address & dIn_h & phitIn(DATA_WIDTH-1 downto 0) after PDELAY;
                vld_buf <= vld_pkt after PDELAY;
            end if;
            if vld_buf_ld='1' then
                vld_buf <= eop after PDELAY;
            end if;

            if phase_ld='1' then
                phase_prev <= phase_next after PDELAY;
                phase_next <= slt_entry(1 downto 0) or not (vld_slt & vld_slt) or not (dma_ctrl & dma_ctrl) after PDELAY;
            end if;

            if pkt_in(LINK_WIDTH-1)='1' then
                phitIn <= pkt_in after PDELAY;
            else
                phitIn <= (others => '0');
            end if;

            phitOut0 <= phit_togo after PDELAY;
            phitOut1 <= phitOut0 after PDELAY;
            phitOut2 <= phitOut1 after PDELAY;
			config_reg <= proc_in_synchronized.MCmd(1) & config after PDELAY;
			read_cmd_reg <= ocp_cmd_read after PDELAY;

			if resp_ld='1' then
				ocp_dataresp_reg <= ocp_dataresp after PDELAY;
				ocp_response_reg <= ocp_response after PDELAY;
			end if;

		end if;
	end process;





end rtl;


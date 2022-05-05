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
-- Communication scratch pad memory
--
-- Author: Rasmus Bo Soerensen (rasmus@rbscloud.dk)
-- Author: Evangelia Kasapaki
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ocp.all;
use work.config_types.all;
use work.config.all;
use work.argo_types.all;
use work.noc_interface.all;

entity com_spm is
  generic(
    -- 2**SPM_IDX_SIZE is the number of bytes in the SPM
    SPM_IDX_SIZE : natural := 12
    );
  port (
    p_clk : in std_logic;
    n_clk : in std_logic;
    reset : in std_logic;
    ocp_core_m : in ocp_core_m;
    ocp_core_s : out ocp_core_s;
    spm_m    : in mem_if_master;
    spm_s   : out mem_if_slave
  );
end entity ; -- com_spm

architecture arch of com_spm is
--    component tdp_ram is
--        generic (
--            DATA    : integer := 32;
--            ADDR    : integer := SPM_IDX_SIZE
--        );
--        port (
--        -- Port A
--            a_clk   : in  std_logic;
--            a_wr    : in  std_logic;
--            a_addr  : in  std_logic_vector(ADDR-1 downto 0);
--            a_din   : in  std_logic_vector(DATA-1 downto 0);
--            a_dout  : out std_logic_vector(DATA-1 downto 0);
--
--        -- Port B
--            b_clk   : in  std_logic;
--            b_wr    : in  std_logic;
--            b_addr  : in  std_logic_vector(ADDR-1 downto 0);
--            b_din   : in  std_logic_vector(DATA-1 downto 0);
--            b_dout  : out std_logic_vector(DATA-1 downto 0)
--        );
--    end component;

    -- Signals for processor side

    signal wr_h, wr_l : std_logic;
    signal Sdata_h, Sdata_l : unsigned(WORD_WIDTH-1 downto 0);
    signal select_low, select_low_reg : std_logic;
    signal select_high, select_high_reg : std_logic;

    signal MCmd : std_logic_vector(OCP_CMD_WIDTH-1 downto 0);

    signal h_0_en, h_1_en, h_2_en, h_3_en : std_logic;
    signal l_0_en, l_1_en, l_2_en, l_3_en : std_logic;

    -- Signals for network side 

    signal even_wr_word, odd_wr_word : unsigned(WORD_WIDTH-1 downto 0);
    signal even_rd_word, odd_rd_word : unsigned(WORD_WIDTH-1 downto 0);
    signal even_addr : unsigned(SPM_IDX_SIZE-3-1 downto 0);
    signal even_wr, odd_wr : std_logic;

    signal addr_reg : std_logic;

begin

    chip_select : process( ocp_core_m.MAddr )
    begin
        select_high <= '0';
        select_low <= '0';
        if ocp_core_m.MAddr(2) = '1' then
            select_low <= '1';
        else
            select_high <= '1';
        end if;
    end process ; -- chip_select

    wr : process( ocp_core_m.MCmd, select_high, select_low )
    begin
        wr_h <= '0';
        wr_l <= '0';
        if ocp_core_m.MCmd(0) = '1' then
            if select_high = '1' then
                wr_h <= '1';
            elsif select_low = '1' then
                wr_l <= '1';
            end if ;
        end if ;
    end process ; -- wr

    data_in_mux : process( select_high_reg, select_low_reg, SData_l, SData_h, MCmd )
    begin
        ocp_core_s.SData <= (others => '0');
        ocp_core_s.SResp <= OCP_RESP_NULL;
        if MCmd(1) = '1' then
            if select_high_reg = '1' then
                ocp_core_s.SData <= std_logic_vector(SData_h);
            elsif select_low_reg = '1' then
                ocp_core_s.SData <= std_logic_vector(SData_l);
            end if ;
            ocp_core_s.SResp <= OCP_RESP_DVA;
        end if ;

        if MCmd(0) = '1' then
            ocp_core_s.SResp <= OCP_RESP_DVA;
        end if ;
    end process ; -- data_in_mux

    MCmd_reg : process( p_clk )
    begin
        if rising_edge(p_clk) then
            if reset = '0' then
                MCmd <= ocp_core_m.MCmd;
                select_low_reg <= select_low;
                select_high_reg <= select_high;
            else
                MCmd <= (others => '0');
                select_low_reg <= '0';
                select_high_reg <= '0';
            end if ;

        end if ;
    end process ; -- MCmd_reg


h_0_en <= ocp_core_m.MByteEn(0) and wr_h;
h_1_en <= ocp_core_m.MByteEn(1) and wr_h;
h_2_en <= ocp_core_m.MByteEn(2) and wr_h;
h_3_en <= ocp_core_m.MByteEn(3) and wr_h;

l_0_en <= ocp_core_m.MByteEn(0) and wr_l;
l_1_en <= ocp_core_m.MByteEn(1) and wr_l;
l_2_en <= ocp_core_m.MByteEn(2) and wr_l;
l_3_en <= ocp_core_m.MByteEn(3) and wr_l;

-- High SPM instance 0
spm_h_0 : entity work.tdp_bram
generic map (DATA=>WORD_WIDTH/4, ADDR => SPM_IDX_SIZE-3)
port map (a_clk => p_clk,
    a_wr => h_0_en,
    a_addr => unsigned(ocp_core_m.MAddr(SPM_IDX_SIZE-1 downto 3)),
    a_din => unsigned(ocp_core_m.MData(7 downto 0)),
    a_dout => SData_h(7 downto 0),
    b_clk => n_clk,
    b_wr => even_wr,
    b_addr => even_addr,
    b_din => even_wr_word(7 downto 0),
    b_dout => even_rd_word(7 downto 0));

-- High SPM instance 1
spm_h_1 : entity work.tdp_bram
generic map (DATA=>WORD_WIDTH/4, ADDR => SPM_IDX_SIZE-3)
port map (a_clk => p_clk,
    a_wr => h_1_en,
    a_addr => unsigned(ocp_core_m.MAddr(SPM_IDX_SIZE-1 downto 3)),
    a_din => unsigned(ocp_core_m.MData(15 downto 8)),
    a_dout => SData_h(15 downto 8),
    b_clk => n_clk,
    b_wr => even_wr,
    b_addr => even_addr,
    b_din => even_wr_word(15 downto 8),
    b_dout => even_rd_word(15 downto 8));

-- High SPM instance 2
spm_h_2 : entity work.tdp_bram
generic map (DATA=>WORD_WIDTH/4, ADDR => SPM_IDX_SIZE-3)
port map (a_clk => p_clk,
    a_wr => h_2_en,
    a_addr => unsigned(ocp_core_m.MAddr(SPM_IDX_SIZE-1 downto 3)),
    a_din => unsigned(ocp_core_m.MData(23 downto 16)),
    a_dout => SData_h(23 downto 16),
    b_clk => n_clk,
    b_wr => even_wr,
    b_addr => even_addr,
    b_din => even_wr_word(23 downto 16),
    b_dout => even_rd_word(23 downto 16));

-- High SPM instance 3
spm_h_3 : entity work.tdp_bram
generic map (DATA=>WORD_WIDTH/4, ADDR => SPM_IDX_SIZE-3)
port map (a_clk => p_clk,
    a_wr => h_3_en,
    a_addr => unsigned(ocp_core_m.MAddr(SPM_IDX_SIZE-1 downto 3)),
    a_din => unsigned(ocp_core_m.MData(31 downto 24)),
    a_dout => SData_h(31 downto 24),
    b_clk => n_clk,
    b_wr => even_wr,
    b_addr => even_addr,
    b_din => even_wr_word(31 downto 24),
    b_dout => even_rd_word(31 downto 24));

-- Low SPM instance 0
spm_l_0 : entity work.tdp_bram
generic map (DATA => WORD_WIDTH/4, ADDR => SPM_IDX_SIZE-3)
port map (a_clk => p_clk,
    a_wr => l_0_en,
    a_addr => unsigned(ocp_core_m.MAddr(SPM_IDX_SIZE-1 downto 3)),
    a_din => unsigned(ocp_core_m.MData(7 downto 0)),
    a_dout => SData_l(7 downto 0),
    b_clk => n_clk,
    b_wr => odd_wr,
    b_addr => spm_m.addr(SPM_IDX_SIZE-3 downto 1),
    b_din => odd_wr_word(7 downto 0),
    b_dout => odd_rd_word(7 downto 0));

-- Low SPM instance 1
spm_l_1 : entity work.tdp_bram
generic map (DATA => WORD_WIDTH/4, ADDR => SPM_IDX_SIZE-3)
port map (a_clk => p_clk,
    a_wr => l_1_en,
    a_addr => unsigned(ocp_core_m.MAddr(SPM_IDX_SIZE-1 downto 3)),
    a_din => unsigned(ocp_core_m.MData(15 downto 8)),
    a_dout => SData_l(15 downto 8),
    b_clk => n_clk,
    b_wr => odd_wr,
    b_addr => spm_m.addr(SPM_IDX_SIZE-3 downto 1),
    b_din => odd_wr_word(15 downto 8),
    b_dout => odd_rd_word(15 downto 8));

-- Low SPM instance 2
spm_l_2 : entity work.tdp_bram
generic map (DATA => WORD_WIDTH/4, ADDR => SPM_IDX_SIZE-3)
port map (a_clk => p_clk,
    a_wr => l_2_en,
    a_addr => unsigned(ocp_core_m.MAddr(SPM_IDX_SIZE-1 downto 3)),
    a_din => unsigned(ocp_core_m.MData(23 downto 16)),
    a_dout => SData_l(23 downto 16),
    b_clk => n_clk,
    b_wr => odd_wr,
    b_addr => spm_m.addr(SPM_IDX_SIZE-3 downto 1),
    b_din => odd_wr_word(23 downto 16),
    b_dout => odd_rd_word(23 downto 16));

-- Low SPM instance 3
spm_l_3 : entity work.tdp_bram
generic map (DATA => WORD_WIDTH/4, ADDR => SPM_IDX_SIZE-3)
port map (a_clk => p_clk,
    a_wr => l_3_en,
    a_addr => unsigned(ocp_core_m.MAddr(SPM_IDX_SIZE-1 downto 3)),
    a_din => unsigned(ocp_core_m.MData(31 downto 24)),
    a_dout => SData_l(31 downto 24),
    b_clk => n_clk,
    b_wr => odd_wr,
    b_addr => spm_m.addr(SPM_IDX_SIZE-3 downto 1),
    b_din => odd_wr_word(31 downto 24),
    b_dout => odd_rd_word(31 downto 24));


slave_wr_mux : process( spm_m.addr(0), spm_m.addr, spm_m.en, spm_m.wr, spm_m.wdata )
begin
    if spm_m.addr(0) = '0' then
        even_addr <= spm_m.addr(SPM_IDX_SIZE-3 downto 1);
        even_wr_word <= spm_m.wdata(2*WORD_WIDTH-1 downto WORD_WIDTH);
        even_wr   <= spm_m.wr and spm_m.en(0);
        odd_wr_word  <= spm_m.wdata(WORD_WIDTH-1 downto 0);
        odd_wr    <= spm_m.wr and spm_m.en(1);
    else
        even_addr <= spm_m.addr(SPM_IDX_SIZE-3 downto 1) + 1;
        even_wr_word <= spm_m.wdata(WORD_WIDTH-1 downto 0);
        even_wr   <= spm_m.wr and spm_m.en(1);
        odd_wr_word  <= spm_m.wdata(2*WORD_WIDTH-1 downto WORD_WIDTH);
        odd_wr    <= spm_m.wr and spm_m.en(0);
    end if ;
end process ; -- slave_mux

slave_rd_mux : process( addr_reg, even_rd_word, odd_rd_word )
begin
    if addr_reg = '0' then
        spm_s.rdata(2*WORD_WIDTH-1 downto WORD_WIDTH) <= even_rd_word;
        spm_s.rdata(WORD_WIDTH-1 downto 0) <= odd_rd_word;
    else
        spm_s.rdata(2*WORD_WIDTH-1 downto WORD_WIDTH) <= odd_rd_word;
        spm_s.rdata(WORD_WIDTH-1 downto 0) <= even_rd_word;
    end if ;
end process ; -- slave_rd_mux

addr_reg_proc : process( n_clk )
begin
    if rising_edge(n_clk) then
        addr_reg <= spm_m.addr(0);
    end if ;
end process ; -- addr_reg_proc

end architecture ; -- arch

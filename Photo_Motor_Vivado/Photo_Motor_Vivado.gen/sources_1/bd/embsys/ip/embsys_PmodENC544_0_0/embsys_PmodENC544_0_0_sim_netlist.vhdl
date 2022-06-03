-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Fri Jun  3 07:04:57 2022
-- Host        : BACCHUS running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top embsys_PmodENC544_0_0 -prefix
--               embsys_PmodENC544_0_0_ embsys_PmodENC544_0_0_sim_netlist.vhdl
-- Design      : embsys_PmodENC544_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity embsys_PmodENC544_0_0_debounce is
  port (
    db_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    encBTN : in STD_LOGIC;
    encSWT : in STD_LOGIC
  );
end embsys_PmodENC544_0_0_debounce;

architecture STRUCTURE of embsys_PmodENC544_0_0_debounce is
  signal data0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal db_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \db_count[31]_i_10_n_0\ : STD_LOGIC;
  signal \db_count[31]_i_1_n_0\ : STD_LOGIC;
  signal \db_count[31]_i_3_n_0\ : STD_LOGIC;
  signal \db_count[31]_i_4_n_0\ : STD_LOGIC;
  signal \db_count[31]_i_5_n_0\ : STD_LOGIC;
  signal \db_count[31]_i_6_n_0\ : STD_LOGIC;
  signal \db_count[31]_i_7_n_0\ : STD_LOGIC;
  signal \db_count[31]_i_8_n_0\ : STD_LOGIC;
  signal \db_count[31]_i_9_n_0\ : STD_LOGIC;
  signal db_count_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \db_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \db_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \db_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \db_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \db_count_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \db_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \db_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \db_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \db_count_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \db_count_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \db_count_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \db_count_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \db_count_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \db_count_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \db_count_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \db_count_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \db_count_reg[28]_i_1_n_0\ : STD_LOGIC;
  signal \db_count_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \db_count_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \db_count_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \db_count_reg[31]_i_2_n_2\ : STD_LOGIC;
  signal \db_count_reg[31]_i_2_n_3\ : STD_LOGIC;
  signal \db_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \db_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \db_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \db_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \db_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \db_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \db_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \db_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \^db_out\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \db_out[0]_i_1_n_0\ : STD_LOGIC;
  signal \db_out[1]_i_1_n_0\ : STD_LOGIC;
  signal in00 : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal in1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_out : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_db_count_reg[31]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_db_count_reg[31]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \db_count[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \db_count[31]_i_4\ : label is "soft_lutpair0";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \db_count_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \db_count_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \db_count_reg[20]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \db_count_reg[24]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \db_count_reg[28]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \db_count_reg[31]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \db_count_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \db_count_reg[8]_i_1\ : label is 35;
begin
  db_out(1 downto 0) <= \^db_out\(1 downto 0);
\db_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => db_count(0),
      O => db_count_0(0)
    );
\db_count[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \db_count[31]_i_3_n_0\,
      I1 => \db_count[31]_i_4_n_0\,
      I2 => \db_count[31]_i_5_n_0\,
      I3 => \db_count[31]_i_6_n_0\,
      O => \db_count[31]_i_1_n_0\
    );
\db_count[31]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => db_count(21),
      I1 => db_count(20),
      I2 => db_count(23),
      I3 => db_count(22),
      O => \db_count[31]_i_10_n_0\
    );
\db_count[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF7FF"
    )
        port map (
      I0 => db_count(10),
      I1 => db_count(11),
      I2 => db_count(8),
      I3 => db_count(9),
      I4 => \db_count[31]_i_7_n_0\,
      O => \db_count[31]_i_3_n_0\
    );
\db_count[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => db_count(2),
      I1 => db_count(3),
      I2 => db_count(0),
      I3 => db_count(1),
      I4 => \db_count[31]_i_8_n_0\,
      O => \db_count[31]_i_4_n_0\
    );
\db_count[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => db_count(26),
      I1 => db_count(27),
      I2 => db_count(24),
      I3 => db_count(25),
      I4 => \db_count[31]_i_9_n_0\,
      O => \db_count[31]_i_5_n_0\
    );
\db_count[31]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => db_count(18),
      I1 => db_count(19),
      I2 => db_count(16),
      I3 => db_count(17),
      I4 => \db_count[31]_i_10_n_0\,
      O => \db_count[31]_i_6_n_0\
    );
\db_count[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => db_count(13),
      I1 => db_count(12),
      I2 => db_count(14),
      I3 => db_count(15),
      O => \db_count[31]_i_7_n_0\
    );
\db_count[31]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => db_count(4),
      I1 => db_count(5),
      I2 => db_count(7),
      I3 => db_count(6),
      O => \db_count[31]_i_8_n_0\
    );
\db_count[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => db_count(29),
      I1 => db_count(28),
      I2 => db_count(31),
      I3 => db_count(30),
      O => \db_count[31]_i_9_n_0\
    );
\db_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => db_count_0(0),
      Q => db_count(0),
      R => '0'
    );
\db_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(10),
      Q => db_count(10),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(11),
      Q => db_count(11),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(12),
      Q => db_count(12),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \db_count_reg[8]_i_1_n_0\,
      CO(3) => \db_count_reg[12]_i_1_n_0\,
      CO(2) => \db_count_reg[12]_i_1_n_1\,
      CO(1) => \db_count_reg[12]_i_1_n_2\,
      CO(0) => \db_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => db_count(12 downto 9)
    );
\db_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(13),
      Q => db_count(13),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(14),
      Q => db_count(14),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(15),
      Q => db_count(15),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(16),
      Q => db_count(16),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \db_count_reg[12]_i_1_n_0\,
      CO(3) => \db_count_reg[16]_i_1_n_0\,
      CO(2) => \db_count_reg[16]_i_1_n_1\,
      CO(1) => \db_count_reg[16]_i_1_n_2\,
      CO(0) => \db_count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3 downto 0) => db_count(16 downto 13)
    );
\db_count_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(17),
      Q => db_count(17),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(18),
      Q => db_count(18),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(19),
      Q => db_count(19),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(1),
      Q => db_count(1),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(20),
      Q => db_count(20),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \db_count_reg[16]_i_1_n_0\,
      CO(3) => \db_count_reg[20]_i_1_n_0\,
      CO(2) => \db_count_reg[20]_i_1_n_1\,
      CO(1) => \db_count_reg[20]_i_1_n_2\,
      CO(0) => \db_count_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3 downto 0) => db_count(20 downto 17)
    );
\db_count_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(21),
      Q => db_count(21),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(22),
      Q => db_count(22),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(23),
      Q => db_count(23),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(24),
      Q => db_count(24),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \db_count_reg[20]_i_1_n_0\,
      CO(3) => \db_count_reg[24]_i_1_n_0\,
      CO(2) => \db_count_reg[24]_i_1_n_1\,
      CO(1) => \db_count_reg[24]_i_1_n_2\,
      CO(0) => \db_count_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(24 downto 21),
      S(3 downto 0) => db_count(24 downto 21)
    );
\db_count_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(25),
      Q => db_count(25),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(26),
      Q => db_count(26),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(27),
      Q => db_count(27),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(28),
      Q => db_count(28),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \db_count_reg[24]_i_1_n_0\,
      CO(3) => \db_count_reg[28]_i_1_n_0\,
      CO(2) => \db_count_reg[28]_i_1_n_1\,
      CO(1) => \db_count_reg[28]_i_1_n_2\,
      CO(0) => \db_count_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(28 downto 25),
      S(3 downto 0) => db_count(28 downto 25)
    );
\db_count_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(29),
      Q => db_count(29),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(2),
      Q => db_count(2),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(30),
      Q => db_count(30),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(31),
      Q => db_count(31),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[31]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \db_count_reg[28]_i_1_n_0\,
      CO(3 downto 2) => \NLW_db_count_reg[31]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \db_count_reg[31]_i_2_n_2\,
      CO(0) => \db_count_reg[31]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_db_count_reg[31]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => db_count(31 downto 29)
    );
\db_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(3),
      Q => db_count(3),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(4),
      Q => db_count(4),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \db_count_reg[4]_i_1_n_0\,
      CO(2) => \db_count_reg[4]_i_1_n_1\,
      CO(1) => \db_count_reg[4]_i_1_n_2\,
      CO(0) => \db_count_reg[4]_i_1_n_3\,
      CYINIT => db_count(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => db_count(4 downto 1)
    );
\db_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(5),
      Q => db_count(5),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(6),
      Q => db_count(6),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(7),
      Q => db_count(7),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(8),
      Q => db_count(8),
      R => \db_count[31]_i_1_n_0\
    );
\db_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \db_count_reg[4]_i_1_n_0\,
      CO(3) => \db_count_reg[8]_i_1_n_0\,
      CO(2) => \db_count_reg[8]_i_1_n_1\,
      CO(1) => \db_count_reg[8]_i_1_n_2\,
      CO(0) => \db_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => db_count(8 downto 5)
    );
\db_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => data0(9),
      Q => db_count(9),
      R => \db_count[31]_i_1_n_0\
    );
\db_out[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE8000"
    )
        port map (
      I0 => p_0_out(0),
      I1 => in00(3),
      I2 => in00(2),
      I3 => in00(1),
      I4 => \^db_out\(0),
      O => \db_out[0]_i_1_n_0\
    );
\db_out[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE8000"
    )
        port map (
      I0 => in1(3),
      I1 => in1(2),
      I2 => in1(1),
      I3 => in1(0),
      I4 => \^db_out\(1),
      O => \db_out[1]_i_1_n_0\
    );
\db_out_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \db_out[0]_i_1_n_0\,
      Q => \^db_out\(0),
      R => '0'
    );
\db_out_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \db_out[1]_i_1_n_0\,
      Q => \^db_out\(1),
      R => '0'
    );
\in0_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \db_count[31]_i_1_n_0\,
      D => encBTN,
      Q => in00(1),
      R => '0'
    );
\in0_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \db_count[31]_i_1_n_0\,
      D => in00(1),
      Q => in00(2),
      R => '0'
    );
\in0_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \db_count[31]_i_1_n_0\,
      D => in00(2),
      Q => in00(3),
      R => '0'
    );
\in0_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \db_count[31]_i_1_n_0\,
      D => in00(3),
      Q => p_0_out(0),
      R => '0'
    );
\in1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \db_count[31]_i_1_n_0\,
      D => encSWT,
      Q => in1(0),
      R => '0'
    );
\in1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \db_count[31]_i_1_n_0\,
      D => in1(0),
      Q => in1(1),
      R => '0'
    );
\in1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \db_count[31]_i_1_n_0\,
      D => in1(1),
      Q => in1(2),
      R => '0'
    );
\in1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \db_count[31]_i_1_n_0\,
      D => in1(2),
      Q => in1(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity embsys_PmodENC544_0_0_rotary_filter is
  port (
    rotary_event : out STD_LOGIC;
    O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rotary_left_reg_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rotary_left_reg_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rotary_left_reg_2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rotary_left_reg_3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rotary_left_reg_4 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rotary_left_reg_5 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rotary_left_reg_6 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    encA : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    encB : in STD_LOGIC;
    rotary_count_reg : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end embsys_PmodENC544_0_0_rotary_filter;

architecture STRUCTURE of embsys_PmodENC544_0_0_rotary_filter is
  signal delay_rotary_q1 : STD_LOGIC;
  signal \in\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \rotary_count[0]_i_2_n_0\ : STD_LOGIC;
  signal \rotary_count[0]_i_3_n_0\ : STD_LOGIC;
  signal \rotary_count[0]_i_4_n_0\ : STD_LOGIC;
  signal \rotary_count[12]_i_2_n_0\ : STD_LOGIC;
  signal \rotary_count[12]_i_3_n_0\ : STD_LOGIC;
  signal \rotary_count[12]_i_4_n_0\ : STD_LOGIC;
  signal \rotary_count[12]_i_5_n_0\ : STD_LOGIC;
  signal \rotary_count[16]_i_2_n_0\ : STD_LOGIC;
  signal \rotary_count[16]_i_3_n_0\ : STD_LOGIC;
  signal \rotary_count[16]_i_4_n_0\ : STD_LOGIC;
  signal \rotary_count[16]_i_5_n_0\ : STD_LOGIC;
  signal \rotary_count[20]_i_2_n_0\ : STD_LOGIC;
  signal \rotary_count[20]_i_3_n_0\ : STD_LOGIC;
  signal \rotary_count[20]_i_4_n_0\ : STD_LOGIC;
  signal \rotary_count[20]_i_5_n_0\ : STD_LOGIC;
  signal \rotary_count[24]_i_2_n_0\ : STD_LOGIC;
  signal \rotary_count[24]_i_3_n_0\ : STD_LOGIC;
  signal \rotary_count[24]_i_4_n_0\ : STD_LOGIC;
  signal \rotary_count[24]_i_5_n_0\ : STD_LOGIC;
  signal \rotary_count[28]_i_2_n_0\ : STD_LOGIC;
  signal \rotary_count[28]_i_3_n_0\ : STD_LOGIC;
  signal \rotary_count[28]_i_4_n_0\ : STD_LOGIC;
  signal \rotary_count[28]_i_5_n_0\ : STD_LOGIC;
  signal \rotary_count[4]_i_2_n_0\ : STD_LOGIC;
  signal \rotary_count[4]_i_3_n_0\ : STD_LOGIC;
  signal \rotary_count[4]_i_4_n_0\ : STD_LOGIC;
  signal \rotary_count[4]_i_5_n_0\ : STD_LOGIC;
  signal \rotary_count[8]_i_2_n_0\ : STD_LOGIC;
  signal \rotary_count[8]_i_3_n_0\ : STD_LOGIC;
  signal \rotary_count[8]_i_4_n_0\ : STD_LOGIC;
  signal \rotary_count[8]_i_5_n_0\ : STD_LOGIC;
  signal \rotary_count_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \rotary_count_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \rotary_count_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \rotary_count_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \rotary_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \rotary_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \rotary_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \rotary_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \rotary_count_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \rotary_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \rotary_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \rotary_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \rotary_count_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \rotary_count_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \rotary_count_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \rotary_count_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \rotary_count_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \rotary_count_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \rotary_count_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \rotary_count_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \rotary_count_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \rotary_count_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \rotary_count_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \rotary_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \rotary_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \rotary_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \rotary_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \rotary_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \rotary_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \rotary_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \rotary_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal rotary_event_i_1_n_0 : STD_LOGIC;
  signal rotary_left_i_1_n_0 : STD_LOGIC;
  signal rotary_q1 : STD_LOGIC;
  signal rotary_q1_i_1_n_0 : STD_LOGIC;
  signal rotary_q2 : STD_LOGIC;
  signal rotary_q2_i_1_n_0 : STD_LOGIC;
  signal \NLW_rotary_count_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \rotary_count_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rotary_count_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rotary_count_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rotary_count_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rotary_count_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rotary_count_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rotary_count_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rotary_count_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of rotary_event_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of rotary_left_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of rotary_q1_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of rotary_q2_i_1 : label is "soft_lutpair2";
begin
delay_rotary_q1_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => rotary_q1,
      Q => delay_rotary_q1,
      R => '0'
    );
rotary_a_int_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => encA,
      Q => p_0_in(0),
      R => '0'
    );
rotary_b_int_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => encB,
      Q => p_0_in(1),
      R => '0'
    );
\rotary_count[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(3),
      O => \rotary_count[0]_i_2_n_0\
    );
\rotary_count[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(2),
      O => \rotary_count[0]_i_3_n_0\
    );
\rotary_count[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(1),
      O => \rotary_count[0]_i_4_n_0\
    );
\rotary_count[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(15),
      O => \rotary_count[12]_i_2_n_0\
    );
\rotary_count[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(14),
      O => \rotary_count[12]_i_3_n_0\
    );
\rotary_count[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(13),
      O => \rotary_count[12]_i_4_n_0\
    );
\rotary_count[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(12),
      O => \rotary_count[12]_i_5_n_0\
    );
\rotary_count[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(19),
      O => \rotary_count[16]_i_2_n_0\
    );
\rotary_count[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(18),
      O => \rotary_count[16]_i_3_n_0\
    );
\rotary_count[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(17),
      O => \rotary_count[16]_i_4_n_0\
    );
\rotary_count[16]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(16),
      O => \rotary_count[16]_i_5_n_0\
    );
\rotary_count[20]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(23),
      O => \rotary_count[20]_i_2_n_0\
    );
\rotary_count[20]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(22),
      O => \rotary_count[20]_i_3_n_0\
    );
\rotary_count[20]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(21),
      O => \rotary_count[20]_i_4_n_0\
    );
\rotary_count[20]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(20),
      O => \rotary_count[20]_i_5_n_0\
    );
\rotary_count[24]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(27),
      O => \rotary_count[24]_i_2_n_0\
    );
\rotary_count[24]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(26),
      O => \rotary_count[24]_i_3_n_0\
    );
\rotary_count[24]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(25),
      O => \rotary_count[24]_i_4_n_0\
    );
\rotary_count[24]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(24),
      O => \rotary_count[24]_i_5_n_0\
    );
\rotary_count[28]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(31),
      O => \rotary_count[28]_i_2_n_0\
    );
\rotary_count[28]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(30),
      O => \rotary_count[28]_i_3_n_0\
    );
\rotary_count[28]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(29),
      O => \rotary_count[28]_i_4_n_0\
    );
\rotary_count[28]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(28),
      O => \rotary_count[28]_i_5_n_0\
    );
\rotary_count[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(7),
      O => \rotary_count[4]_i_2_n_0\
    );
\rotary_count[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(6),
      O => \rotary_count[4]_i_3_n_0\
    );
\rotary_count[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(5),
      O => \rotary_count[4]_i_4_n_0\
    );
\rotary_count[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(4),
      O => \rotary_count[4]_i_5_n_0\
    );
\rotary_count[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(11),
      O => \rotary_count[8]_i_2_n_0\
    );
\rotary_count[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(10),
      O => \rotary_count[8]_i_3_n_0\
    );
\rotary_count[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(9),
      O => \rotary_count[8]_i_4_n_0\
    );
\rotary_count[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \in\,
      I1 => rotary_count_reg(8),
      O => \rotary_count[8]_i_5_n_0\
    );
\rotary_count_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \rotary_count_reg[0]_i_1_n_0\,
      CO(2) => \rotary_count_reg[0]_i_1_n_1\,
      CO(1) => \rotary_count_reg[0]_i_1_n_2\,
      CO(0) => \rotary_count_reg[0]_i_1_n_3\,
      CYINIT => '1',
      DI(3) => \in\,
      DI(2) => \in\,
      DI(1) => \in\,
      DI(0) => '0',
      O(3 downto 0) => O(3 downto 0),
      S(3) => \rotary_count[0]_i_2_n_0\,
      S(2) => \rotary_count[0]_i_3_n_0\,
      S(1) => \rotary_count[0]_i_4_n_0\,
      S(0) => rotary_count_reg(0)
    );
\rotary_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rotary_count_reg[8]_i_1_n_0\,
      CO(3) => \rotary_count_reg[12]_i_1_n_0\,
      CO(2) => \rotary_count_reg[12]_i_1_n_1\,
      CO(1) => \rotary_count_reg[12]_i_1_n_2\,
      CO(0) => \rotary_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \in\,
      DI(2) => \in\,
      DI(1) => \in\,
      DI(0) => \in\,
      O(3 downto 0) => rotary_left_reg_2(3 downto 0),
      S(3) => \rotary_count[12]_i_2_n_0\,
      S(2) => \rotary_count[12]_i_3_n_0\,
      S(1) => \rotary_count[12]_i_4_n_0\,
      S(0) => \rotary_count[12]_i_5_n_0\
    );
\rotary_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rotary_count_reg[12]_i_1_n_0\,
      CO(3) => \rotary_count_reg[16]_i_1_n_0\,
      CO(2) => \rotary_count_reg[16]_i_1_n_1\,
      CO(1) => \rotary_count_reg[16]_i_1_n_2\,
      CO(0) => \rotary_count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \in\,
      DI(2) => \in\,
      DI(1) => \in\,
      DI(0) => \in\,
      O(3 downto 0) => rotary_left_reg_3(3 downto 0),
      S(3) => \rotary_count[16]_i_2_n_0\,
      S(2) => \rotary_count[16]_i_3_n_0\,
      S(1) => \rotary_count[16]_i_4_n_0\,
      S(0) => \rotary_count[16]_i_5_n_0\
    );
\rotary_count_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rotary_count_reg[16]_i_1_n_0\,
      CO(3) => \rotary_count_reg[20]_i_1_n_0\,
      CO(2) => \rotary_count_reg[20]_i_1_n_1\,
      CO(1) => \rotary_count_reg[20]_i_1_n_2\,
      CO(0) => \rotary_count_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \in\,
      DI(2) => \in\,
      DI(1) => \in\,
      DI(0) => \in\,
      O(3 downto 0) => rotary_left_reg_4(3 downto 0),
      S(3) => \rotary_count[20]_i_2_n_0\,
      S(2) => \rotary_count[20]_i_3_n_0\,
      S(1) => \rotary_count[20]_i_4_n_0\,
      S(0) => \rotary_count[20]_i_5_n_0\
    );
\rotary_count_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rotary_count_reg[20]_i_1_n_0\,
      CO(3) => \rotary_count_reg[24]_i_1_n_0\,
      CO(2) => \rotary_count_reg[24]_i_1_n_1\,
      CO(1) => \rotary_count_reg[24]_i_1_n_2\,
      CO(0) => \rotary_count_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \in\,
      DI(2) => \in\,
      DI(1) => \in\,
      DI(0) => \in\,
      O(3 downto 0) => rotary_left_reg_5(3 downto 0),
      S(3) => \rotary_count[24]_i_2_n_0\,
      S(2) => \rotary_count[24]_i_3_n_0\,
      S(1) => \rotary_count[24]_i_4_n_0\,
      S(0) => \rotary_count[24]_i_5_n_0\
    );
\rotary_count_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rotary_count_reg[24]_i_1_n_0\,
      CO(3) => \NLW_rotary_count_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \rotary_count_reg[28]_i_1_n_1\,
      CO(1) => \rotary_count_reg[28]_i_1_n_2\,
      CO(0) => \rotary_count_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \in\,
      DI(1) => \in\,
      DI(0) => \in\,
      O(3 downto 0) => rotary_left_reg_6(3 downto 0),
      S(3) => \rotary_count[28]_i_2_n_0\,
      S(2) => \rotary_count[28]_i_3_n_0\,
      S(1) => \rotary_count[28]_i_4_n_0\,
      S(0) => \rotary_count[28]_i_5_n_0\
    );
\rotary_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rotary_count_reg[0]_i_1_n_0\,
      CO(3) => \rotary_count_reg[4]_i_1_n_0\,
      CO(2) => \rotary_count_reg[4]_i_1_n_1\,
      CO(1) => \rotary_count_reg[4]_i_1_n_2\,
      CO(0) => \rotary_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \in\,
      DI(2) => \in\,
      DI(1) => \in\,
      DI(0) => \in\,
      O(3 downto 0) => rotary_left_reg_0(3 downto 0),
      S(3) => \rotary_count[4]_i_2_n_0\,
      S(2) => \rotary_count[4]_i_3_n_0\,
      S(1) => \rotary_count[4]_i_4_n_0\,
      S(0) => \rotary_count[4]_i_5_n_0\
    );
\rotary_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rotary_count_reg[4]_i_1_n_0\,
      CO(3) => \rotary_count_reg[8]_i_1_n_0\,
      CO(2) => \rotary_count_reg[8]_i_1_n_1\,
      CO(1) => \rotary_count_reg[8]_i_1_n_2\,
      CO(0) => \rotary_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \in\,
      DI(2) => \in\,
      DI(1) => \in\,
      DI(0) => \in\,
      O(3 downto 0) => rotary_left_reg_1(3 downto 0),
      S(3) => \rotary_count[8]_i_2_n_0\,
      S(2) => \rotary_count[8]_i_3_n_0\,
      S(1) => \rotary_count[8]_i_4_n_0\,
      S(0) => \rotary_count[8]_i_5_n_0\
    );
rotary_event_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rotary_q1,
      I1 => delay_rotary_q1,
      O => rotary_event_i_1_n_0
    );
rotary_event_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => rotary_event_i_1_n_0,
      Q => rotary_event,
      R => '0'
    );
rotary_left_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => rotary_q2,
      I1 => rotary_q1,
      I2 => delay_rotary_q1,
      I3 => \in\,
      O => rotary_left_i_1_n_0
    );
rotary_left_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => rotary_left_i_1_n_0,
      Q => \in\,
      R => '0'
    );
rotary_q1_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => rotary_q1,
      I1 => p_0_in(0),
      I2 => p_0_in(1),
      O => rotary_q1_i_1_n_0
    );
rotary_q1_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => rotary_q1_i_1_n_0,
      Q => rotary_q1,
      R => '0'
    );
rotary_q2_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D4"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(1),
      I2 => rotary_q2,
      O => rotary_q2_i_1_n_0
    );
rotary_q2_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => rotary_q2_i_1_n_0,
      Q => rotary_q2,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity embsys_PmodENC544_0_0_PmodENC544_v1_0_S00_AXI is
  port (
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    encA : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    encB : in STD_LOGIC;
    encBTN : in STD_LOGIC;
    encSWT : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end embsys_PmodENC544_0_0_PmodENC544_v1_0_S00_AXI;

architecture STRUCTURE of embsys_PmodENC544_0_0_PmodENC544_v1_0_S00_AXI is
  signal ROTFILTER_n_1 : STD_LOGIC;
  signal ROTFILTER_n_10 : STD_LOGIC;
  signal ROTFILTER_n_11 : STD_LOGIC;
  signal ROTFILTER_n_12 : STD_LOGIC;
  signal ROTFILTER_n_13 : STD_LOGIC;
  signal ROTFILTER_n_14 : STD_LOGIC;
  signal ROTFILTER_n_15 : STD_LOGIC;
  signal ROTFILTER_n_16 : STD_LOGIC;
  signal ROTFILTER_n_17 : STD_LOGIC;
  signal ROTFILTER_n_18 : STD_LOGIC;
  signal ROTFILTER_n_19 : STD_LOGIC;
  signal ROTFILTER_n_2 : STD_LOGIC;
  signal ROTFILTER_n_20 : STD_LOGIC;
  signal ROTFILTER_n_21 : STD_LOGIC;
  signal ROTFILTER_n_22 : STD_LOGIC;
  signal ROTFILTER_n_23 : STD_LOGIC;
  signal ROTFILTER_n_24 : STD_LOGIC;
  signal ROTFILTER_n_25 : STD_LOGIC;
  signal ROTFILTER_n_26 : STD_LOGIC;
  signal ROTFILTER_n_27 : STD_LOGIC;
  signal ROTFILTER_n_28 : STD_LOGIC;
  signal ROTFILTER_n_29 : STD_LOGIC;
  signal ROTFILTER_n_3 : STD_LOGIC;
  signal ROTFILTER_n_30 : STD_LOGIC;
  signal ROTFILTER_n_31 : STD_LOGIC;
  signal ROTFILTER_n_32 : STD_LOGIC;
  signal ROTFILTER_n_4 : STD_LOGIC;
  signal ROTFILTER_n_5 : STD_LOGIC;
  signal ROTFILTER_n_6 : STD_LOGIC;
  signal ROTFILTER_n_7 : STD_LOGIC;
  signal ROTFILTER_n_8 : STD_LOGIC;
  signal ROTFILTER_n_9 : STD_LOGIC;
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal axi_awaddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_awaddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_awready_i_1_n_0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal db_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 7 );
  signal reg_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rotary_count_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rotary_event : STD_LOGIC;
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal \slv_reg2[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[10]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[11]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[12]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[13]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[14]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[15]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[16]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[17]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[18]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[19]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[1]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[20]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[21]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[22]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[23]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[24]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[25]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[26]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[27]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[28]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[29]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[2]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[30]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[31]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[3]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[4]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[5]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[6]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[7]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[8]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[9]\ : STD_LOGIC;
  signal slv_reg3 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg_rden__0\ : STD_LOGIC;
  signal \slv_reg_wren__0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axi_araddr[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \slv_reg3[31]_i_2\ : label is "soft_lutpair4";
begin
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  S_AXI_WREADY <= \^s_axi_wready\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
DEBOUNCER: entity work.embsys_PmodENC544_0_0_debounce
     port map (
      db_out(1 downto 0) => db_out(1 downto 0),
      encBTN => encBTN,
      encSWT => encSWT,
      s00_axi_aclk => s00_axi_aclk
    );
ROTFILTER: entity work.embsys_PmodENC544_0_0_rotary_filter
     port map (
      O(3) => ROTFILTER_n_1,
      O(2) => ROTFILTER_n_2,
      O(1) => ROTFILTER_n_3,
      O(0) => ROTFILTER_n_4,
      encA => encA,
      encB => encB,
      rotary_count_reg(31 downto 0) => rotary_count_reg(31 downto 0),
      rotary_event => rotary_event,
      rotary_left_reg_0(3) => ROTFILTER_n_5,
      rotary_left_reg_0(2) => ROTFILTER_n_6,
      rotary_left_reg_0(1) => ROTFILTER_n_7,
      rotary_left_reg_0(0) => ROTFILTER_n_8,
      rotary_left_reg_1(3) => ROTFILTER_n_9,
      rotary_left_reg_1(2) => ROTFILTER_n_10,
      rotary_left_reg_1(1) => ROTFILTER_n_11,
      rotary_left_reg_1(0) => ROTFILTER_n_12,
      rotary_left_reg_2(3) => ROTFILTER_n_13,
      rotary_left_reg_2(2) => ROTFILTER_n_14,
      rotary_left_reg_2(1) => ROTFILTER_n_15,
      rotary_left_reg_2(0) => ROTFILTER_n_16,
      rotary_left_reg_3(3) => ROTFILTER_n_17,
      rotary_left_reg_3(2) => ROTFILTER_n_18,
      rotary_left_reg_3(1) => ROTFILTER_n_19,
      rotary_left_reg_3(0) => ROTFILTER_n_20,
      rotary_left_reg_4(3) => ROTFILTER_n_21,
      rotary_left_reg_4(2) => ROTFILTER_n_22,
      rotary_left_reg_4(1) => ROTFILTER_n_23,
      rotary_left_reg_4(0) => ROTFILTER_n_24,
      rotary_left_reg_5(3) => ROTFILTER_n_25,
      rotary_left_reg_5(2) => ROTFILTER_n_26,
      rotary_left_reg_5(1) => ROTFILTER_n_27,
      rotary_left_reg_5(0) => ROTFILTER_n_28,
      rotary_left_reg_6(3) => ROTFILTER_n_29,
      rotary_left_reg_6(2) => ROTFILTER_n_30,
      rotary_left_reg_6(1) => ROTFILTER_n_31,
      rotary_left_reg_6(0) => ROTFILTER_n_32,
      s00_axi_aclk => s00_axi_aclk
    );
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFC4CCC4CCC4CC"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => aw_en_reg_n_0,
      I2 => \^s_axi_awready\,
      I3 => s00_axi_wvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => axi_awready_i_1_n_0
    );
\axi_araddr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(0),
      I1 => s00_axi_arvalid,
      I2 => \^s_axi_arready\,
      I3 => axi_araddr(2),
      O => \axi_araddr[2]_i_1_n_0\
    );
\axi_araddr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(1),
      I1 => s00_axi_arvalid,
      I2 => \^s_axi_arready\,
      I3 => axi_araddr(3),
      O => \axi_araddr[3]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[2]_i_1_n_0\,
      Q => axi_araddr(2),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[3]_i_1_n_0\,
      Q => axi_araddr(3),
      R => axi_awready_i_1_n_0
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^s_axi_arready\,
      R => axi_awready_i_1_n_0
    );
\axi_awaddr[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s00_axi_awaddr(0),
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_awready\,
      I3 => aw_en_reg_n_0,
      I4 => s00_axi_awvalid,
      I5 => axi_awaddr(2),
      O => \axi_awaddr[2]_i_1_n_0\
    );
\axi_awaddr[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_awready\,
      I3 => aw_en_reg_n_0,
      I4 => s00_axi_awvalid,
      I5 => axi_awaddr(3),
      O => \axi_awaddr[3]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[2]_i_1_n_0\,
      Q => axi_awaddr(2),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[3]_i_1_n_0\,
      Q => axi_awaddr(3),
      R => axi_awready_i_1_n_0
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => axi_awready_i_1_n_0
    );
axi_awready_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \^s_axi_awready\,
      I2 => aw_en_reg_n_0,
      I3 => s00_axi_awvalid,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^s_axi_awready\,
      R => axi_awready_i_1_n_0
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_awready\,
      I3 => \^s_axi_wready\,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => axi_awready_i_1_n_0
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(0),
      I1 => db_out(0),
      I2 => axi_araddr(2),
      I3 => clear,
      I4 => axi_araddr(3),
      I5 => rotary_count_reg(0),
      O => reg_data_out(0)
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(10),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[10]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(10),
      O => reg_data_out(10)
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(11),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[11]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(11),
      O => reg_data_out(11)
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(12),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[12]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(12),
      O => reg_data_out(12)
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(13),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[13]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(13),
      O => reg_data_out(13)
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(14),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[14]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(14),
      O => reg_data_out(14)
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(15),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[15]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(15),
      O => reg_data_out(15)
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(16),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[16]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(16),
      O => reg_data_out(16)
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(17),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[17]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(17),
      O => reg_data_out(17)
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(18),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[18]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(18),
      O => reg_data_out(18)
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(19),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[19]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(19),
      O => reg_data_out(19)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg3(1),
      I1 => db_out(1),
      I2 => axi_araddr(2),
      I3 => \slv_reg2_reg_n_0_[1]\,
      I4 => axi_araddr(3),
      I5 => rotary_count_reg(1),
      O => reg_data_out(1)
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(20),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[20]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(20),
      O => reg_data_out(20)
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(21),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[21]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(21),
      O => reg_data_out(21)
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(22),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[22]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(22),
      O => reg_data_out(22)
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(23),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[23]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(23),
      O => reg_data_out(23)
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(24),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[24]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(24),
      O => reg_data_out(24)
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(25),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[25]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(25),
      O => reg_data_out(25)
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(26),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[26]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(26),
      O => reg_data_out(26)
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(27),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[27]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(27),
      O => reg_data_out(27)
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(28),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[28]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(28),
      O => reg_data_out(28)
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(29),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[29]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(29),
      O => reg_data_out(29)
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(2),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[2]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(2),
      O => reg_data_out(2)
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(30),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[30]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(30),
      O => reg_data_out(30)
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(31),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[31]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(31),
      O => reg_data_out(31)
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(3),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[3]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(3),
      O => reg_data_out(3)
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(4),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[4]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(4),
      O => reg_data_out(4)
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(5),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[5]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(5),
      O => reg_data_out(5)
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(6),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[6]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(6),
      O => reg_data_out(6)
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(7),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[7]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(7),
      O => reg_data_out(7)
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(8),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[8]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(8),
      O => reg_data_out(8)
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B833B800"
    )
        port map (
      I0 => slv_reg3(9),
      I1 => axi_araddr(2),
      I2 => \slv_reg2_reg_n_0_[9]\,
      I3 => axi_araddr(3),
      I4 => rotary_count_reg(9),
      O => reg_data_out(9)
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(0),
      Q => s00_axi_rdata(0),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(10),
      Q => s00_axi_rdata(10),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(11),
      Q => s00_axi_rdata(11),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(12),
      Q => s00_axi_rdata(12),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(13),
      Q => s00_axi_rdata(13),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(14),
      Q => s00_axi_rdata(14),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(15),
      Q => s00_axi_rdata(15),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(16),
      Q => s00_axi_rdata(16),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(17),
      Q => s00_axi_rdata(17),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(18),
      Q => s00_axi_rdata(18),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(19),
      Q => s00_axi_rdata(19),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(1),
      Q => s00_axi_rdata(1),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(20),
      Q => s00_axi_rdata(20),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(21),
      Q => s00_axi_rdata(21),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(22),
      Q => s00_axi_rdata(22),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(23),
      Q => s00_axi_rdata(23),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(24),
      Q => s00_axi_rdata(24),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(25),
      Q => s00_axi_rdata(25),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(26),
      Q => s00_axi_rdata(26),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(27),
      Q => s00_axi_rdata(27),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(28),
      Q => s00_axi_rdata(28),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(29),
      Q => s00_axi_rdata(29),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(2),
      Q => s00_axi_rdata(2),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(30),
      Q => s00_axi_rdata(30),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(31),
      Q => s00_axi_rdata(31),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(3),
      Q => s00_axi_rdata(3),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(4),
      Q => s00_axi_rdata(4),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(5),
      Q => s00_axi_rdata(5),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(6),
      Q => s00_axi_rdata(6),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(7),
      Q => s00_axi_rdata(7),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(8),
      Q => s00_axi_rdata(8),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(9),
      Q => s00_axi_rdata(9),
      R => axi_awready_i_1_n_0
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_rready,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => axi_awready_i_1_n_0
    );
axi_wready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_wready\,
      I3 => aw_en_reg_n_0,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^s_axi_wready\,
      R => axi_awready_i_1_n_0
    );
\rotary_count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_4,
      Q => rotary_count_reg(0)
    );
\rotary_count_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_10,
      Q => rotary_count_reg(10)
    );
\rotary_count_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_9,
      Q => rotary_count_reg(11)
    );
\rotary_count_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_16,
      Q => rotary_count_reg(12)
    );
\rotary_count_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_15,
      Q => rotary_count_reg(13)
    );
\rotary_count_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_14,
      Q => rotary_count_reg(14)
    );
\rotary_count_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_13,
      Q => rotary_count_reg(15)
    );
\rotary_count_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_20,
      Q => rotary_count_reg(16)
    );
\rotary_count_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_19,
      Q => rotary_count_reg(17)
    );
\rotary_count_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_18,
      Q => rotary_count_reg(18)
    );
\rotary_count_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_17,
      Q => rotary_count_reg(19)
    );
\rotary_count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_3,
      Q => rotary_count_reg(1)
    );
\rotary_count_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_24,
      Q => rotary_count_reg(20)
    );
\rotary_count_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_23,
      Q => rotary_count_reg(21)
    );
\rotary_count_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_22,
      Q => rotary_count_reg(22)
    );
\rotary_count_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_21,
      Q => rotary_count_reg(23)
    );
\rotary_count_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_28,
      Q => rotary_count_reg(24)
    );
\rotary_count_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_27,
      Q => rotary_count_reg(25)
    );
\rotary_count_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_26,
      Q => rotary_count_reg(26)
    );
\rotary_count_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_25,
      Q => rotary_count_reg(27)
    );
\rotary_count_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_32,
      Q => rotary_count_reg(28)
    );
\rotary_count_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_31,
      Q => rotary_count_reg(29)
    );
\rotary_count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_2,
      Q => rotary_count_reg(2)
    );
\rotary_count_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_30,
      Q => rotary_count_reg(30)
    );
\rotary_count_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_29,
      Q => rotary_count_reg(31)
    );
\rotary_count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_1,
      Q => rotary_count_reg(3)
    );
\rotary_count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_8,
      Q => rotary_count_reg(4)
    );
\rotary_count_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_7,
      Q => rotary_count_reg(5)
    );
\rotary_count_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_6,
      Q => rotary_count_reg(6)
    );
\rotary_count_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_5,
      Q => rotary_count_reg(7)
    );
\rotary_count_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_12,
      Q => rotary_count_reg(8)
    );
\rotary_count_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => rotary_event,
      CLR => clear,
      D => ROTFILTER_n_11,
      Q => rotary_count_reg(9)
    );
\slv_reg2[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => axi_awaddr(3),
      I2 => s00_axi_wstrb(1),
      I3 => axi_awaddr(2),
      O => \slv_reg2[15]_i_1_n_0\
    );
\slv_reg2[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => axi_awaddr(3),
      I2 => s00_axi_wstrb(2),
      I3 => axi_awaddr(2),
      O => \slv_reg2[23]_i_1_n_0\
    );
\slv_reg2[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => axi_awaddr(3),
      I2 => s00_axi_wstrb(3),
      I3 => axi_awaddr(2),
      O => \slv_reg2[31]_i_1_n_0\
    );
\slv_reg2[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => axi_awaddr(3),
      I2 => s00_axi_wstrb(0),
      I3 => axi_awaddr(2),
      O => \slv_reg2[7]_i_1_n_0\
    );
\slv_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => clear,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg2_reg_n_0_[10]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg2_reg_n_0_[11]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg2_reg_n_0_[12]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg2_reg_n_0_[13]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg2_reg_n_0_[14]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg2_reg_n_0_[15]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg2_reg_n_0_[16]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg2_reg_n_0_[17]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg2_reg_n_0_[18]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg2_reg_n_0_[19]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg2_reg_n_0_[1]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg2_reg_n_0_[20]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg2_reg_n_0_[21]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg2_reg_n_0_[22]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg2_reg_n_0_[23]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg2_reg_n_0_[24]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg2_reg_n_0_[25]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg2_reg_n_0_[26]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg2_reg_n_0_[27]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg2_reg_n_0_[28]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg2_reg_n_0_[29]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg2_reg_n_0_[2]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg2_reg_n_0_[30]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg2_reg_n_0_[31]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg2_reg_n_0_[3]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg2_reg_n_0_[4]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg2_reg_n_0_[5]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg2_reg_n_0_[6]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg2_reg_n_0_[7]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg2_reg_n_0_[8]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg2_reg_n_0_[9]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg3[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(2),
      I3 => s00_axi_wstrb(1),
      O => p_1_in(15)
    );
\slv_reg3[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(2),
      I3 => s00_axi_wstrb(2),
      O => p_1_in(23)
    );
\slv_reg3[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(2),
      I3 => s00_axi_wstrb(3),
      O => p_1_in(31)
    );
\slv_reg3[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^s_axi_wready\,
      I1 => \^s_axi_awready\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      O => \slv_reg_wren__0\
    );
\slv_reg3[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(2),
      I3 => s00_axi_wstrb(0),
      O => p_1_in(7)
    );
\slv_reg3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(0),
      Q => slv_reg3(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(10),
      Q => slv_reg3(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(11),
      Q => slv_reg3(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(12),
      Q => slv_reg3(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(13),
      Q => slv_reg3(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(14),
      Q => slv_reg3(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(15),
      Q => slv_reg3(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(16),
      Q => slv_reg3(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(17),
      Q => slv_reg3(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(18),
      Q => slv_reg3(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(19),
      Q => slv_reg3(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(1),
      Q => slv_reg3(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(20),
      Q => slv_reg3(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(21),
      Q => slv_reg3(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(22),
      Q => slv_reg3(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(23),
      Q => slv_reg3(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(24),
      Q => slv_reg3(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(25),
      Q => slv_reg3(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(26),
      Q => slv_reg3(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(27),
      Q => slv_reg3(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(28),
      Q => slv_reg3(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(29),
      Q => slv_reg3(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(2),
      Q => slv_reg3(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(30),
      Q => slv_reg3(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(31),
      Q => slv_reg3(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(3),
      Q => slv_reg3(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(4),
      Q => slv_reg3(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(5),
      Q => slv_reg3(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(6),
      Q => slv_reg3(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(7),
      Q => slv_reg3(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(8),
      Q => slv_reg3(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(9),
      Q => slv_reg3(9),
      R => axi_awready_i_1_n_0
    );
slv_reg_rden: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_rvalid\,
      I2 => \^s_axi_arready\,
      O => \slv_reg_rden__0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity embsys_PmodENC544_0_0_PmodENC544_v1_0 is
  port (
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    encA : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    encB : in STD_LOGIC;
    encBTN : in STD_LOGIC;
    encSWT : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end embsys_PmodENC544_0_0_PmodENC544_v1_0;

architecture STRUCTURE of embsys_PmodENC544_0_0_PmodENC544_v1_0 is
begin
PmodENC544_v1_0_S00_AXI_inst: entity work.embsys_PmodENC544_0_0_PmodENC544_v1_0_S00_AXI
     port map (
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_WREADY => S_AXI_WREADY,
      encA => encA,
      encB => encB,
      encBTN => encBTN,
      encSWT => encSWT,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(1 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(1 downto 0),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity embsys_PmodENC544_0_0 is
  port (
    encA : in STD_LOGIC;
    encB : in STD_LOGIC;
    encBTN : in STD_LOGIC;
    encSWT : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of embsys_PmodENC544_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of embsys_PmodENC544_0_0 : entity is "embsys_PmodENC544_0_0,PmodENC544_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of embsys_PmodENC544_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of embsys_PmodENC544_0_0 : entity is "PmodENC544_v1_0,Vivado 2020.2";
end embsys_PmodENC544_0_0;

architecture STRUCTURE of embsys_PmodENC544_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
begin
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.embsys_PmodENC544_0_0_PmodENC544_v1_0
     port map (
      S_AXI_ARREADY => s00_axi_arready,
      S_AXI_AWREADY => s00_axi_awready,
      S_AXI_WREADY => s00_axi_wready,
      encA => encA,
      encB => encB,
      encBTN => encBTN,
      encSWT => encSWT,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(3 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(3 downto 2),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;

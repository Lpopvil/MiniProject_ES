-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer1_layer1_weights_0_rom is 
    generic(
             DWIDTH     : integer := 32; 
             AWIDTH     : integer := 7; 
             MEM_SIZE    : integer := 100
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of nn_inference_hwmm_layer1_layer1_weights_0_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111101101101100000100010010101", 
    1 => "00111110000111000111000101111011", 
    2 => "10111101101010110101010110111101", 
    3 => "00111110010111111110010000110011", 
    4 => "00111110011000011110001100110001", 
    5 => "00111110100010011110011100011011", 
    6 => "00111110010010100111110110000001", 
    7 => "10111101101010101010101000111011", 
    8 => "10111110000100110110000101100000", 
    9 => "10111101010110011111111100100101", 
    10 => "10111101110101001011100010001100", 
    11 => "10111110001000110010011011110101", 
    12 => "00111101000001000110110101110101", 
    13 => "00111100110010010000101110101010", 
    14 => "00111110010010100001011111001010", 
    15 => "00111110010000111011000100111010", 
    16 => "00111101000111000111100100100111", 
    17 => "10111110000010001101111000001111", 
    18 => "00111110000001010111110110010000", 
    19 => "00111110100110110000011001110001", 
    20 => "00111101110111011000111000001001", 
    21 => "00111101101110011010101110011110", 
    22 => "10111101110101010001011000011011", 
    23 => "10111101101110100000100000010011", 
    24 => "00111101000110011101010100101011", 
    25 => "00111110100100010100010101111111", 
    26 => "00111101011100100101110011100001", 
    27 => "00111110000101000010010101010000", 
    28 => "10111101111111000100011011000001", 
    29 => "00111011011111000110110111010000", 
    30 => "10111101100000100110110110101011", 
    31 => "00111101001100000011011001100001", 
    32 => "00111101000111110001100001011111", 
    33 => "00111110010101011100110111010000", 
    34 => "00111011111011111010100100101110", 
    35 => "00111101111110000010001011110111", 
    36 => "00111110010110000110111010001001", 
    37 => "00111101010011010011010011000100", 
    38 => "00111110000101001011010010100101", 
    39 => "00111101100000110010100101100110", 
    40 => "00111100110010011111001111111101", 
    41 => "10111110100100101000100001000001", 
    42 => "00111110000010100110000011011011", 
    43 => "00111101110101101111100000100000", 
    44 => "00111010100001011001001101010110", 
    45 => "00111110010111011000000110000110", 
    46 => "10111101011111110110000100100110", 
    47 => "00111101000011101110101100001000", 
    48 => "10111110010001101001111101110001", 
    49 => "10111110010111101011101001000010", 
    50 => "10111101111100111110110111000100", 
    51 => "10111110001110010000110101011111", 
    52 => "00111101100001000010010101100010", 
    53 => "00111101111111000001100011111101", 
    54 => "00111101110110011111001001101111", 
    55 => "00111110000101110100110110001100", 
    56 => "00111110011001011001101111101000", 
    57 => "10111110010110110010111011100101", 
    58 => "10111101111110001001100101111100", 
    59 => "00111101101001011000101111111001", 
    60 => "00111011101001011001001101001011", 
    61 => "00111101101001110100110011000111", 
    62 => "00111101101101011001000000010110", 
    63 => "00111100001000100111001100100110", 
    64 => "00111101111001010110000011001100", 
    65 => "10111110000011001011000111000000", 
    66 => "10111101100101110101110110000101", 
    67 => "00111101100010000111000100001011", 
    68 => "00111110000000100010101011111111", 
    69 => "00111110001000011101001001010101", 
    70 => "10111011011001010011111111111011", 
    71 => "00111101101110010101100001001000", 
    72 => "00111101100000001100001001011110", 
    73 => "10111101100000101100111111111011", 
    74 => "10111100100100101100010110001111", 
    75 => "00111101111000100100010000101110", 
    76 => "00111101011001101101110011110000", 
    77 => "10111110000010111010101101000011", 
    78 => "00111100111111101001100010000110", 
    79 => "00111100010100001001001001100010", 
    80 => "00111101011100111011000010101001", 
    81 => "00111101000010010000101111001110", 
    82 => "00111110000000010001110100101100", 
    83 => "10111110001101010111001001011100", 
    84 => "10111101010000111100001100111010", 
    85 => "10111101100010000001011011110010", 
    86 => "10111100110011000111100010101110", 
    87 => "10111101110111100011110011110101", 
    88 => "10111101111111110101011001101010", 
    89 => "10111110011101101101101000000101", 
    90 => "10111011111001100000111110101001", 
    91 => "10111110000100101011100110110111", 
    92 => "00111100101111001111101100010111", 
    93 => "00111101111000001110011101000010", 
    94 => "00111100110111100100000100000001", 
    95 => "10111101111100101100110111111001", 
    96 => "10111101110110000011011000000100", 
    97 => "10111101010000010011011000100110", 
    98 => "10111101100110100010110101010110", 
    99 => "00111100000001011011000101111000" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity nn_inference_hwmm_layer1_layer1_weights_0 is
    generic (
        DataWidth : INTEGER := 32;
        AddressRange : INTEGER := 100;
        AddressWidth : INTEGER := 7);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of nn_inference_hwmm_layer1_layer1_weights_0 is
    component nn_inference_hwmm_layer1_layer1_weights_0_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer1_layer1_weights_0_rom_U :  component nn_inference_hwmm_layer1_layer1_weights_0_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


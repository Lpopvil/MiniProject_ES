-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer1_layer1_weights_5_rom is 
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


architecture rtl of nn_inference_hwmm_layer1_layer1_weights_5_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111110001110100111101100011001", 
    1 => "00111100100001101011111110111100", 
    2 => "00111110000000001100000010000010", 
    3 => "10111011101000100001110101100111", 
    4 => "10111110001010000111110011100001", 
    5 => "00111101110001001000111011011011", 
    6 => "00111101100111110100001111010110", 
    7 => "00111101010100010010010110100111", 
    8 => "00111101111000000110111010111010", 
    9 => "10111101100101110011101100101111", 
    10 => "00111110100001111111100011101100", 
    11 => "10111101101000001110000111001010", 
    12 => "10111011011011101000010100010001", 
    13 => "00111101100000011101000000001110", 
    14 => "10111100000001001111011010100000", 
    15 => "10111101000101001110000110111000", 
    16 => "00111110001001100111000010100001", 
    17 => "10111101101010110110111111010011", 
    18 => "00111101101101011101100110100001", 
    19 => "10111110010011111110011101011110", 
    20 => "00111110000100010111100011110000", 
    21 => "00111110000000010101110010101100", 
    22 => "00111110000001011101000000100110", 
    23 => "10111110011001001001010010111100", 
    24 => "00111101101010111010111010111011", 
    25 => "00111101001000101101110000110011", 
    26 => "10111110100011110111011010000010", 
    27 => "10111110001010111101110110010001", 
    28 => "10111101110000001011010000100000", 
    29 => "00111110000101111010110111100101", 
    30 => "00111110100001010011010011001111", 
    31 => "00111110010010100101011100001101", 
    32 => "00111110001100111111001011000010", 
    33 => "10111101110101101101001101100100", 
    34 => "10111101111010011101011101001101", 
    35 => "00111110000011011011001101001000", 
    36 => "10111100101111101000100000010111", 
    37 => "00111101101100010001000101100000", 
    38 => "10111100100010100010111010011001", 
    39 => "10111101111100100000010111110011", 
    40 => "10111101111110010000111101011000", 
    41 => "00111101100011010101110011000101", 
    42 => "10111101011000100010010110001111", 
    43 => "00111110001101001111010001111011", 
    44 => "00111110001100110010001001010101", 
    45 => "00111101101001111110110111110011", 
    46 => "10111101110000101010010101111001", 
    47 => "00111100001100000000110110001011", 
    48 => "10111100110111001000001011011011", 
    49 => "00111110010000100000111100101111", 
    50 => "00111100101100000010000000110010", 
    51 => "00111110001011011111001000000100", 
    52 => "00111110010001110101001101010110", 
    53 => "00111101001001000111111110101010", 
    54 => "00111110010111110001010100101011", 
    55 => "10111100110111110110111011101101", 
    56 => "10111101110101101000010110011110", 
    57 => "00111011000111111001010000100000", 
    58 => "10111100010100010100001100100100", 
    59 => "10111101111110001000000010100101", 
    60 => "10111100100010101100000001000111", 
    61 => "10111101010101001010111001010010", 
    62 => "00111101111010110011111010001100", 
    63 => "00111100101111101000100011101001", 
    64 => "10111101101110001101001101011100", 
    65 => "00111110100010100101010100010011", 
    66 => "00111110010100100010001110011011", 
    67 => "00111110001001000001110011110110", 
    68 => "00111101100001011001000010100000", 
    69 => "10111110000100110010001001000010", 
    70 => "00111110001000111111010101001000", 
    71 => "00111110011101110011011111110110", 
    72 => "00111110001011010100100010000010", 
    73 => "00111110001000010100001100011110", 
    74 => "10111101100111100110010111111011", 
    75 => "00111110010011101010110101011110", 
    76 => "00111110100000000010010000110101", 
    77 => "00111100100111111111011000011010", 
    78 => "00111101101011011110011010101010", 
    79 => "10111110000111101001110100101110", 
    80 => "00111101101001111000100101011010", 
    81 => "00111110001110001111010001000101", 
    82 => "10111110000001110001100100000001", 
    83 => "00111101111001011111110001100110", 
    84 => "00111110011101010010000001110011", 
    85 => "10111110000101110110101101000001", 
    86 => "00111101010111100011011100000111", 
    87 => "10111100100000111000111011110100", 
    88 => "10111101010100110110011101001001", 
    89 => "10111110001001010011100100001101", 
    90 => "10111101011101101010101100001010", 
    91 => "00111101000000010000011101011101", 
    92 => "00111110000000101110011010111101", 
    93 => "00111110011110001000101110000001", 
    94 => "00111110000110110011101101011011", 
    95 => "00111110010111000101010010101011", 
    96 => "10111101001000111000100100101111", 
    97 => "10111100011000100001000001110010", 
    98 => "00111110011110100000010011001011", 
    99 => "10111101011010000100111100010010" );


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

entity nn_inference_hwmm_layer1_layer1_weights_5 is
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

architecture arch of nn_inference_hwmm_layer1_layer1_weights_5 is
    component nn_inference_hwmm_layer1_layer1_weights_5_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer1_layer1_weights_5_rom_U :  component nn_inference_hwmm_layer1_layer1_weights_5_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


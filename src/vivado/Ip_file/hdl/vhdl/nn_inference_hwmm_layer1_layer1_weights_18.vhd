-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer1_layer1_weights_18_rom is 
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


architecture rtl of nn_inference_hwmm_layer1_layer1_weights_18_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111110100010000101111110000000", 
    1 => "00111110000111010101101110010101", 
    2 => "00111110100110001100101110000111", 
    3 => "00111101010010110001111011000011", 
    4 => "00111110111001101001111010100111", 
    5 => "00111110100010011111001100101100", 
    6 => "10111101000000101110001001110011", 
    7 => "10111110100101000011000011110110", 
    8 => "10111100111000010011000100001100", 
    9 => "10111111001000001111111010100101", 
    10 => "00111110000100111100011100001001", 
    11 => "10111101101011110010011000110110", 
    12 => "00111110001011101101001111011010", 
    13 => "00111110101011001001001011000001", 
    14 => "00111110100000001000001011010011", 
    15 => "00111101110000110110111000001000", 
    16 => "00111110000101111010111001001010", 
    17 => "10111110101000111101001111000110", 
    18 => "10111110001000111110001001001111", 
    19 => "10111110111011100011001110001001", 
    20 => "00111100111111110011000111100000", 
    21 => "00111110011011111100000110011101", 
    22 => "00111101100010110101001010111111", 
    23 => "00111110001000111110111000110111", 
    24 => "00111110001100010010101101011111", 
    25 => "00111110110001001001001001001100", 
    26 => "00111110001101001010001001010101", 
    27 => "00111101011001000111001101110001", 
    28 => "10111110101000000011010110100100", 
    29 => "10111110101001010000100010111000", 
    30 => "00111110111000010100111001111011", 
    31 => "00111110010000100001111111000101", 
    32 => "10111101101010001011011001101101", 
    33 => "00111110001111101001101010001111", 
    34 => "10111101011001110000000100011110", 
    35 => "10111110100011110110100001101110", 
    36 => "00111110001111100100001001001101", 
    37 => "00111100110111010100100100100100", 
    38 => "10111111001000001010000101111100", 
    39 => "10111111011101001110000011001010", 
    40 => "00111111000011011110100100110000", 
    41 => "00111101101011100011111101110100", 
    42 => "10111101100110011000111000000101", 
    43 => "00111100011001110011111001101111", 
    44 => "10111110010010100110011111101001", 
    45 => "10111110000010001100000010001100", 
    46 => "00111101100100101000001111001101", 
    47 => "00111110001011111001011111110001", 
    48 => "10111100111101100011010011000100", 
    49 => "00111110001011000010100000111000", 
    50 => "00111110100000011011110001101100", 
    51 => "00111101110101101111010110110110", 
    52 => "00111110001001010011101000110011", 
    53 => "00111110010001101001101000000101", 
    54 => "00111110101010111101111000110010", 
    55 => "00111101100101001001111111101111", 
    56 => "00111110011001100010011111000111", 
    57 => "00111101111001011011011111101011", 
    58 => "10111101100100101101111010101010", 
    59 => "00111111001101000011000000000000", 
    60 => "10111110111100111000111110011001", 
    61 => "00111110100110111110011110101111", 
    62 => "00111110000011100001010100111101", 
    63 => "00111110110000000110000000001111", 
    64 => "00111110100001001011011001101011", 
    65 => "00111101110010111100110110010011", 
    66 => "00111110101011000010011010010111", 
    67 => "00111110101000101001001000000111", 
    68 => "00111110010011111001111101001100", 
    69 => "00111110111001001111111000100000", 
    70 => "10111110100010000101111111101110", 
    71 => "00111110000101101011110101111011", 
    72 => "00111101110001111011101101101111", 
    73 => "00111110100110011110101110110100", 
    74 => "00111110011100111111001111011101", 
    75 => "10111011001100000001010101001111", 
    76 => "00111101110111011100100011010001", 
    77 => "00111110000000010100011111101100", 
    78 => "00111101101010000001011010011010", 
    79 => "00111110110110010101101001000111", 
    80 => "10111111000100100111101110001010", 
    81 => "00111101100000000010101111110100", 
    82 => "00111110011100110010111101100111", 
    83 => "00111110001000110101010100110010", 
    84 => "00111101011000000110001001110000", 
    85 => "10111101010111010101011011011000", 
    86 => "00111110000000111001011011110000", 
    87 => "00111111000101001011100010001110", 
    88 => "00111111001000110110011000001010", 
    89 => "00111110110100001000001001111101", 
    90 => "10111110010001001010101111010000", 
    91 => "10111110110001110001000001011000", 
    92 => "10111110101010001001000001101111", 
    93 => "10111110111001001110001000010000", 
    94 => "10111110010111101001110011001011", 
    95 => "00111010111001011010101111011000", 
    96 => "00111100100110011110000000111110", 
    97 => "10111110010000011101001111100100", 
    98 => "10111110010000010101101110100100", 
    99 => "00111110001000100111101110001100" );


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

entity nn_inference_hwmm_layer1_layer1_weights_18 is
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

architecture arch of nn_inference_hwmm_layer1_layer1_weights_18 is
    component nn_inference_hwmm_layer1_layer1_weights_18_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer1_layer1_weights_18_rom_U :  component nn_inference_hwmm_layer1_layer1_weights_18_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


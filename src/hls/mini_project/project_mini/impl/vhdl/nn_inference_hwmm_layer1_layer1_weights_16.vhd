-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer1_layer1_weights_16_rom is 
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


architecture rtl of nn_inference_hwmm_layer1_layer1_weights_16_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "10111110000111101111001011111110", 
    1 => "00111100000001000010000001110000", 
    2 => "10111110010001010000001001101001", 
    3 => "10111110100011111110111000101111", 
    4 => "10111101100110101101100011110011", 
    5 => "10111110100000101011101101010110", 
    6 => "10111110001000000001111111001101", 
    7 => "10111110010111001011100010011001", 
    8 => "00111100111110100000001101011111", 
    9 => "10111100110100100100110100011111", 
    10 => "10111110011001010001111110110100", 
    11 => "00111100111001101001111100101110", 
    12 => "10111101111111100110001111010011", 
    13 => "00111100010001000111101100100100", 
    14 => "00111110010110011010110000100110", 
    15 => "00111110011110101110100111100100", 
    16 => "10111101000010100010100001110011", 
    17 => "10111110000011110001001001000100", 
    18 => "00111101001101100100000101011011", 
    19 => "00111011110100100001111000101010", 
    20 => "10111110010111000100010111011001", 
    21 => "10111110100110011001101000000110", 
    22 => "00111100101011011111110000000010", 
    23 => "10111110100011000010001001011100", 
    24 => "10111110011000101110101000101101", 
    25 => "00111110001000000100110000010010", 
    26 => "00111110100100111011011000110000", 
    27 => "00111110010111010011110000000100", 
    28 => "00111110000010100101011000100110", 
    29 => "00111110000001000011100111101111", 
    30 => "00111100011110111111101000100110", 
    31 => "10111101001111011011111100010011", 
    32 => "10111110010000110100100011110110", 
    33 => "10111101101011001011000101010111", 
    34 => "10111100101010001001101100110100", 
    35 => "10111110001011111010011110100001", 
    36 => "10111100001001100001000001101100", 
    37 => "00111110010101000111101001101010", 
    38 => "00111011000011100001011001001101", 
    39 => "00111101110011110100010000000110", 
    40 => "10111110000000101001111010100001", 
    41 => "10111011110010000101001110100001", 
    42 => "00111100100000001100110101011011", 
    43 => "10111100101011110001101011001110", 
    44 => "10111110100101111111001111111111", 
    45 => "00111100001001000111011000000110", 
    46 => "10111101110100000000110110101100", 
    47 => "00111110100111011110011001011111", 
    48 => "00111110011110101010011110001110", 
    49 => "10111110010010000001000010100100", 
    50 => "10111110100001011011111000011001", 
    51 => "10111011111110001101111001001111", 
    52 => "10111110100000010010010001100110", 
    53 => "00111101010011100100100111100000", 
    54 => "10111110100100011001110111100010", 
    55 => "10111110010100111110101100010100", 
    56 => "00111011000100011100110101111001", 
    57 => "00111110011101110011011010011000", 
    58 => "00111110100101001111100111000111", 
    59 => "10111101001011011011010010110000", 
    60 => "00111110000101111101111110010010", 
    61 => "10111110011100100100011011100111", 
    62 => "00111110000000011111111001010001", 
    63 => "00111101011000101111001010011101", 
    64 => "00111101001101010111111111101111", 
    65 => "00111100111111001010111010110001", 
    66 => "00111110100010111101101010110000", 
    67 => "00111101110010110100110010111001", 
    68 => "10111101011101010101001010010000", 
    69 => "10111101100101111111111111111010", 
    70 => "00111101110011001101001101110110", 
    71 => "10111101110011000100010010110011", 
    72 => "10111011101110010101101110100011", 
    73 => "10111100111100101010000100101111", 
    74 => "00111100101001111110111011000111", 
    75 => "00111100101000010110011100011100", 
    76 => "00111110100001001101101010111001", 
    77 => "10111011001110000000100100110000", 
    78 => "10111110000101000001001010001010", 
    79 => "00111101101011111111100111001011", 
    80 => "10111101110000010111000001011111", 
    81 => "10111100001101001110010001000100", 
    82 => "00111110000001010000000010010011", 
    83 => "10111101110000001110101001101011", 
    84 => "00111110011100101100010100000111", 
    85 => "00111110001010110110110111100111", 
    86 => "00111110000101111011010001001001", 
    87 => "10111101001101000100000001011100", 
    88 => "00111110010011111000000101100100", 
    89 => "10111010000010110000101010001111", 
    90 => "00111110000110101111111110101010", 
    91 => "00111110000001101110110000000011", 
    92 => "10111101101101111000110111011000", 
    93 => "00111010110000100111101100100101", 
    94 => "10111110000110101101000100011011", 
    95 => "00111110010011000001101101001111", 
    96 => "00111101110100010100001100010111", 
    97 => "00111011111000101111011110001000", 
    98 => "00111110010010001011101011000010", 
    99 => "00111110011100011111101101101001" );


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

entity nn_inference_hwmm_layer1_layer1_weights_16 is
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

architecture arch of nn_inference_hwmm_layer1_layer1_weights_16 is
    component nn_inference_hwmm_layer1_layer1_weights_16_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer1_layer1_weights_16_rom_U :  component nn_inference_hwmm_layer1_layer1_weights_16_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


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
    0 => "00111101001011110110000001001100", 
    1 => "10111100101001111000010001100101", 
    2 => "10111101110111001100011011010101", 
    3 => "00111110011110101001100000100101", 
    4 => "00111101100011000100011111011100", 
    5 => "10111100100011001001011100011110", 
    6 => "00111110011000011011100000000000", 
    7 => "00111110011011011010111000010101", 
    8 => "00111110001110101110111111000011", 
    9 => "00111110100110111010100111101110", 
    10 => "10111110110100011101111110000011", 
    11 => "10111110101000111001100001101111", 
    12 => "10111110100110000010010100001010", 
    13 => "10111110001001100100111111001100", 
    14 => "00111100000010111101001011101110", 
    15 => "00111110001110111011110011101110", 
    16 => "00111101101011101011010110111110", 
    17 => "00111101110100000001010111001101", 
    18 => "00111110010101000101100000001111", 
    19 => "00111110000100000000111000110000", 
    20 => "00111110000101011100111001110001", 
    21 => "10111110000111010001001111000010", 
    22 => "00111101111110010011111110001100", 
    23 => "00111110010101010001111110010011", 
    24 => "00111110110000011110111000010011", 
    25 => "00111110000001100110110100111111", 
    26 => "00111110101110010111101101110010", 
    27 => "00111110110000011011010101111101", 
    28 => "00111101000001100111011000001111", 
    29 => "00111111000000000001110001001101", 
    30 => "00111110011010001111010000010110", 
    31 => "00111101010111110100010111011110", 
    32 => "00111110010100111110000011011101", 
    33 => "00111110110101100001111010001010", 
    34 => "00111110011100001111110100011101", 
    35 => "10111101010111110010110111011011", 
    36 => "00111101101010110001111110111010", 
    37 => "10111101001000000100100111100001", 
    38 => "00111110101011000110000010111011", 
    39 => "00111110110100101111111011010001", 
    40 => "00111110011111011110101000110100", 
    41 => "00111110000001111001011100101010", 
    42 => "00111110001101101011010111001001", 
    43 => "00111101000101001011110011110100", 
    44 => "10111101111110000010001110010101", 
    45 => "00111110000010011011100110110101", 
    46 => "00111110000000101111011010100111", 
    47 => "00111110011100110100110111010000", 
    48 => "00111110100001001011011110010101", 
    49 => "00111110111001000010100111100011", 
    50 => "00111110010000101100100110111110", 
    51 => "00111110010001000000111001100111", 
    52 => "00111101100111000001101110011001", 
    53 => "00111100111000111110000110101011", 
    54 => "00111110110101001000110111010001", 
    55 => "00111110110110110010101011000101", 
    56 => "00111110101010100001010111010010", 
    57 => "10111110000111110110001111000011", 
    58 => "10111101011111111011011001101011", 
    59 => "00111111001001011000001000011100", 
    60 => "10111110010111011001010011111100", 
    61 => "00111100011100111000010001110111", 
    62 => "00111110010101101111011010010111", 
    63 => "00111100110000110110101001100001", 
    64 => "00111110101100110110010001000011", 
    65 => "00111110110010110110101110010100", 
    66 => "00111110000111101010111000111001", 
    67 => "00111110000011000101110000110101", 
    68 => "00111110010111110110100011011011", 
    69 => "00111110011100101010011100110011", 
    70 => "10111110000111011100111111010010", 
    71 => "10111110001000101110101001010011", 
    72 => "00111100101001101110111111011110", 
    73 => "00111100001101011001010000011101", 
    74 => "00111110101010111001010011111000", 
    75 => "10111101000001000101110011000001", 
    76 => "00111110100011011000000001111011", 
    77 => "00111101011100001001011011101011", 
    78 => "00111110100111011111111111000111", 
    79 => "00111110100010101011110111111111", 
    80 => "10111110010111000011101010010110", 
    81 => "10111100101110100111110100101001", 
    82 => "00111110100100010010010111011010", 
    83 => "00111111000010011000111011110001", 
    84 => "00111110010100111110111111010001", 
    85 => "00111110100100001000001000111011", 
    86 => "00111110010001111111010111010010", 
    87 => "00111110111101011111110000000100", 
    88 => "00111111000110000110100001111011", 
    89 => "00111111000110110101010111010101", 
    90 => "10111110111101110000001101001000", 
    91 => "10111110100111001010101001111010", 
    92 => "10111110000110111010100000111100", 
    93 => "00111110001000001000101000010000", 
    94 => "00111101101101001111011011101011", 
    95 => "00111110101100011101100000110110", 
    96 => "10111110000010011110101111001100", 
    97 => "10111011000010010110111100011001", 
    98 => "10111110001010100011111001010100", 
    99 => "00111110101000101111110011000001" );


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


-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer1_layer1_weights_27_rom is 
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


architecture rtl of nn_inference_hwmm_layer1_layer1_weights_27_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111110000100010011101010110011", 
    1 => "00111101110111010101101001010110", 
    2 => "00111101111100111101010001001010", 
    3 => "00111110001111010101010011111111", 
    4 => "00111101101101000100001100110010", 
    5 => "10111011101101111110011010000101", 
    6 => "00111101110110100101111111010100", 
    7 => "10111110010010101011111101100010", 
    8 => "00111110000100110000000110001100", 
    9 => "10111100010101100101000111101101", 
    10 => "10111101011110110110010011010000", 
    11 => "10111101100101100110010101101011", 
    12 => "10111110010101101010100110001100", 
    13 => "10111101000011101101101011010011", 
    14 => "00111110001111001010010100101101", 
    15 => "10111110000110010010100010001100", 
    16 => "00111101111111000011011100100011", 
    17 => "10111110000110011111100000100000", 
    18 => "00111101111101001101100110110000", 
    19 => "10111110010010001010000101011001", 
    20 => "10111101111000101000000001101011", 
    21 => "10111101101001010000001100010101", 
    22 => "10111110010100101101011010111001", 
    23 => "10111100101010010100101111000101", 
    24 => "10111101110100100011101100011010", 
    25 => "00111101110010111010101111100001", 
    26 => "00111011111010001111011101101000", 
    27 => "00111100100101010000011100101111", 
    28 => "00111110001011110001010110101010", 
    29 => "00111101101001010110011101011010", 
    30 => "00111110000101101101010111101011", 
    31 => "00111101101101001100110101000101", 
    32 => "00111101101011010101110000111100", 
    33 => "00111110000100000100000010111000", 
    34 => "10111100000100010011100101001101", 
    35 => "00111100001000100011000110110111", 
    36 => "00111101010010101000100101100010", 
    37 => "10111110010101100111111000100011", 
    38 => "00111101111100110001000111100000", 
    39 => "10111101111000101010100010101111", 
    40 => "10111100111000000000100010010010", 
    41 => "10111110001011100000001000001010", 
    42 => "10111101111000100011010011000010", 
    43 => "00111100110011100101110011101010", 
    44 => "00111100100010100110010011001000", 
    45 => "00111110001001010110011001000100", 
    46 => "00111101101110101001011011100100", 
    47 => "00111100110111010011001010000011", 
    48 => "00111101100111001111110110010001", 
    49 => "10111110000011011101010010000010", 
    50 => "00111101111011011010110011100010", 
    51 => "10111110000000000011010001010101", 
    52 => "00111101101001000101111001101000", 
    53 => "10111101111001010001110010111011", 
    54 => "10111101110100010011011101111011", 
    55 => "00111110001110001010100111101001", 
    56 => "10111110001111111111000110110101", 
    57 => "10111101100011011001000011001001", 
    58 => "10111100111001000000011100001000", 
    59 => "00111100010110110001000010011100", 
    60 => "10111101000101111101110010000001", 
    61 => "00111110000001000101101111110101", 
    62 => "10111101000010111010011110001110", 
    63 => "10111101101011011000001011001010", 
    64 => "10111110010101110111010101110100", 
    65 => "00111101101010111001110111111100", 
    66 => "10111100000001100011000000111000", 
    67 => "10111101110110011001111000110000", 
    68 => "10111100010100101101000100010011", 
    69 => "00111101110110011000000001010011", 
    70 => "10111100010011001000100111011010", 
    71 => "10111110000100111101000111000111", 
    72 => "00111101101011101010100000010101", 
    73 => "10111101111000001000110110011011", 
    74 => "10111101100001000100011000000100", 
    75 => "00111101111010110111011101110001", 
    76 => "10111101011001110110011011010111", 
    77 => "10111110010001110001111010010101", 
    78 => "10111110001010101110000111101100", 
    79 => "10111110010100101001111100010111", 
    80 => "00111110000001101100101000110101", 
    81 => "10111110010111110010001001010010", 
    82 => "10111110000011110001000101011101", 
    83 => "00111110000001001110100101111011", 
    84 => "10111110000001111101111110110010", 
    85 => "10111101100100011011100001110111", 
    86 => "10111110000001000111001000011011", 
    87 => "00111110000100110011001111101000", 
    88 => "00111101010010011110110001101000", 
    89 => "10111110010000101100010010110111", 
    90 => "00111011010111000011011110111100", 
    91 => "00111011101010110101111011000111", 
    92 => "10111110001111011100110110100101", 
    93 => "00111100100011100101011001110111", 
    94 => "00111110010001110010100100011110", 
    95 => "00111110001101111111110010000100", 
    96 => "10111101101001100101101011000010", 
    97 => "00111110001001001001110110011001", 
    98 => "10111101111001001111001010000110", 
    99 => "00111110000010100011000110000010" );


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

entity nn_inference_hwmm_layer1_layer1_weights_27 is
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

architecture arch of nn_inference_hwmm_layer1_layer1_weights_27 is
    component nn_inference_hwmm_layer1_layer1_weights_27_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer1_layer1_weights_27_rom_U :  component nn_inference_hwmm_layer1_layer1_weights_27_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


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
    0 => "00111111000111101010101010001001", 
    1 => "00111110110101100011100101110001", 
    2 => "00111110001001100010110101100111", 
    3 => "10111101110001101011110101100010", 
    4 => "00111100101000110101100001111000", 
    5 => "00111110110010010010110110000010", 
    6 => "10111101110010100111110011010100", 
    7 => "10111111000100100100010111001000", 
    8 => "10111110111000011101000001111011", 
    9 => "10111111000010111001101111011100", 
    10 => "00111111010000010101100000011111", 
    11 => "00111111001001100001001100110101", 
    12 => "00111110101011101001111110001010", 
    13 => "00111101101110000000001001000111", 
    14 => "10111100001111110000110100010101", 
    15 => "10111101101000000011001110111100", 
    16 => "10111110101111000100000000001011", 
    17 => "10111110100101100011101001101100", 
    18 => "10111111001010110001101110011101", 
    19 => "10111111000011000010110101101111", 
    20 => "00111110101101110101100101101110", 
    21 => "00111111000111111111101010111011", 
    22 => "00111110101001111011101010010100", 
    23 => "00111110001100100111010110110101", 
    24 => "00111110010001010111001110010001", 
    25 => "00111101100100010100101001110000", 
    26 => "10111101101101111000011110100111", 
    27 => "10111110110001100110010011010100", 
    28 => "10111110011101110110010101001100", 
    29 => "10111110110001011111001101110101", 
    30 => "00111111010111010101000110100111", 
    31 => "00111101110100110010110000010111", 
    32 => "10111110111000100110110111011110", 
    33 => "10111111001001001011010000001101", 
    34 => "10111110101101011000111100110010", 
    35 => "00111110111001010011011000011110", 
    36 => "00111101101011111100100101111011", 
    37 => "10111111001000101000010111101000", 
    38 => "10111110010001111100001101100101", 
    39 => "10111100010011100011101001000101", 
    40 => "00111111010100001110001110000001", 
    41 => "10111111000111011101010001001011", 
    42 => "10111111011111110111100100011110", 
    43 => "10111110011011001100110110110101", 
    44 => "00111101010000010010001111111010", 
    45 => "10111100101011110010000100000111", 
    46 => "10111101110010100010011011010010", 
    47 => "10111110101000100000001101101101", 
    48 => "10111110001010001001011111101111", 
    49 => "00111110110101100101010101001010", 
    50 => "00111111001111101000111001000010", 
    51 => "00111110101111001100011100100010", 
    52 => "00111110100100111001110000100101", 
    53 => "00111110111001000110011010010111", 
    54 => "00111110100010010100110100111111", 
    55 => "00111110000111100101111101111110", 
    56 => "00111110000110101010011010000101", 
    57 => "00111110100110111110110010101111", 
    58 => "00111110101101011001001000111010", 
    59 => "00111110111010001011110000110101", 
    60 => "00111111001110011001101100110111", 
    61 => "00111110100100010101100000000101", 
    62 => "10111110010111110011010111011111", 
    63 => "10111110100100101101000010110110", 
    64 => "10111101101010100000110000100010", 
    65 => "00111110101110011100000000001101", 
    66 => "10111100011010010000011000011001", 
    67 => "00111110100000100011011101011001", 
    68 => "00111110111000000110001000101000", 
    69 => "00111111010111101011101010110101", 
    70 => "00111110111100001000110100010000", 
    71 => "00111101101011110100000011101011", 
    72 => "10111110100110011111110101001010", 
    73 => "10111110100000001111011111111000", 
    74 => "00111100111110110011111011011100", 
    75 => "00111101110110000100011001000101", 
    76 => "00111110010101110100110100001011", 
    77 => "00111110001010111011100110011111", 
    78 => "00111101100010010111101111000011", 
    79 => "00111111001100010000101000010011", 
    80 => "00111111000010011011010000011111", 
    81 => "00111110100111111011000111001101", 
    82 => "00111110011100101011011001000110", 
    83 => "00111110101001100000010000111110", 
    84 => "10111101001000001000011100001011", 
    85 => "10111110001000010011000111001010", 
    86 => "10111110010101000111000101101101", 
    87 => "10111110101111110100010011110111", 
    88 => "10111110000010011010001001110110", 
    89 => "00111111010110011100111010000010", 
    90 => "00111110101110001001010010001100", 
    91 => "00111110101000100010111101001110", 
    92 => "00111110100100111101011101101001", 
    93 => "00111110110010001010111101110110", 
    94 => "00111111000011110000000110101001", 
    95 => "00111110001111101011011011100100", 
    96 => "10111110000001000010111001100010", 
    97 => "10111110010100101001110001000000", 
    98 => "10111110111001111110011000110111", 
    99 => "00111110111110100000110001010100" );


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


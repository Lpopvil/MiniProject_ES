-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity nn_inference_hwmm_layer1_layer1_weights_25_rom is 
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


architecture rtl of nn_inference_hwmm_layer1_layer1_weights_25_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111101110000001010010000011000", 
    1 => "00111110000001011111001100001000", 
    2 => "00111100101100111000000100111111", 
    3 => "10111101110000001011001100100011", 
    4 => "10111101011101111101110011000010", 
    5 => "00111100101001011110000010111011", 
    6 => "10111101111100000001011101010001", 
    7 => "00111101010011111001010011100000", 
    8 => "10111110100011011011111000001111", 
    9 => "10111110101100100101001111101000", 
    10 => "10111100010100101001111111000011", 
    11 => "00111100111000100001010001010110", 
    12 => "00111101101010101001110100011001", 
    13 => "10111101110100101101101111110100", 
    14 => "00111100000001110001100011110011", 
    15 => "10111101101111101011101110000001", 
    16 => "00111101111011110110111110011001", 
    17 => "00111101001111011000010001101011", 
    18 => "00111101010001001001111001111000", 
    19 => "00111101001100100110101111010110", 
    20 => "10111101110011001000100011001110", 
    21 => "00111101100111110010111100110000", 
    22 => "10111101101000111110110110110100", 
    23 => "10111101111011110101110111001100", 
    24 => "00111110010111111000011010001100", 
    25 => "00111110000101101101010110111001", 
    26 => "10111110000010011101101001011010", 
    27 => "00111101000011111011100010001010", 
    28 => "00111101101111001110001000110100", 
    29 => "00111101100010111001110101010110", 
    30 => "10111100101111110110101000001000", 
    31 => "00111101000110111010101111110011", 
    32 => "00111110010001010111110110000010", 
    33 => "10111110011100001011010100000100", 
    34 => "10111101010110100100000001110110", 
    35 => "10111110011101101101100101001001", 
    36 => "00111110000010010001000001010000", 
    37 => "10111101110000110011101101000001", 
    38 => "00111110010011001000000011001110", 
    39 => "00111101100101101111111000110100", 
    40 => "00111110010000011111100101100101", 
    41 => "10111101011101101111110000100110", 
    42 => "00111101110100110110010010001001", 
    43 => "10111101001010110010111011000101", 
    44 => "10111110101001010111111100000100", 
    45 => "10111110100001010101110001101011", 
    46 => "10111110010111110111001100111101", 
    47 => "00111101101001011111011101000101", 
    48 => "00111110010000101000000111111111", 
    49 => "10111101111010001001100001000111", 
    50 => "10111101111110001100000010001100", 
    51 => "00111011110101110101001111100110", 
    52 => "10111101001100101101101101111001", 
    53 => "10111110001111001110100010000000", 
    54 => "10111110000011101010101100011110", 
    55 => "10111110011001101100101010111100", 
    56 => "00111011100011010011110111010111", 
    57 => "00111110010001001001100110100100", 
    58 => "10111101100000000100100100101000", 
    59 => "10111110000110100110011011001010", 
    60 => "00111110011100011110110110100101", 
    61 => "00111101101010010000110101110110", 
    62 => "00111110100101000100100101100011", 
    63 => "00111110011110001010001001010111", 
    64 => "10111110001000111010000010001001", 
    65 => "10111101001001110100000000110000", 
    66 => "00111101110101000001111100111000", 
    67 => "00111100111000011000000111011111", 
    68 => "00111101101110111101010000000101", 
    69 => "10111110001011100000100011101001", 
    70 => "00111110000101011000110111100011", 
    71 => "10111101111011111100111010011011", 
    72 => "00111110101001010000001111001010", 
    73 => "00111110011001110010010100111100", 
    74 => "10111101110010010111101101100011", 
    75 => "00111101111010111000000110001000", 
    76 => "00111110011111010001000111111100", 
    77 => "10111101001001110011101010101111", 
    78 => "00111101000110000110100101101100", 
    79 => "10111101110011011000010100110001", 
    80 => "00111110010110110001100101101010", 
    81 => "00111110000111100010101111110110", 
    82 => "00111110000110110100010010110111", 
    83 => "00111110101001001001011010011100", 
    84 => "00111101101011100010100100011001", 
    85 => "10111100100110101110000101010110", 
    86 => "10111101010001101111000100101110", 
    87 => "00111101100010001100111011100101", 
    88 => "00111110000111101101001101011101", 
    89 => "10111101111100110011111001100101", 
    90 => "00111101111101000010111110111000", 
    91 => "00111110100001110000011111000001", 
    92 => "00111110001101000010101110110001", 
    93 => "00111101100010111011111110011011", 
    94 => "00111101000011111100110010011011", 
    95 => "00111110010011000101001001110010", 
    96 => "00111100010011111000100000010111", 
    97 => "00111100101001011010110000111111", 
    98 => "00111110011110111010101100110010", 
    99 => "00111110001010001101000100010110" );


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

entity nn_inference_hwmm_layer1_layer1_weights_25 is
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

architecture arch of nn_inference_hwmm_layer1_layer1_weights_25 is
    component nn_inference_hwmm_layer1_layer1_weights_25_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    nn_inference_hwmm_layer1_layer1_weights_25_rom_U :  component nn_inference_hwmm_layer1_layer1_weights_25_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


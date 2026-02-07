----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2026 12:52:56 PM
-- Design Name: 
-- Module Name: Carry_Save_Adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.global_cfg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Carry_Save_Adder is
    generic(
        ADDER_SIZE : integer := SIZE
    );
    Port ( 
        i_A     : in std_logic_vector(VECTOR_WIDTH DOWNTO 0);
        i_B     : in std_logic_vector(VECTOR_WIDTH DOWNTO 0);
        i_C     : in std_logic_vector(VECTOR_WIDTH DOWNTO 0); 
        o_sum   : out std_logic_vector(OUTPUT_SIZE   DOWNTO 0); -- CSA have 1 more bit than normal 
        o_carry : out std_logic
    );
end Carry_Save_Adder;

architecture Behavioral of Carry_Save_Adder is
    signal Carry_Save_Sum : std_logic_vector(SIZE DOWNTO 0);
    signal Carry_Save_Cout: std_logic_vector(VECTOR_WIDTH DOWNTO 0);
    signal Ripple_Carry_Sum: std_logic_vector(SIZE    DOWNTO 0); -- COUT of Ripple Carry is appened to the last bit of the Sum
begin

Carry_Save_Inst: entity work.Carry_Save
    port map(
        i_A    => i_A,
        i_B    => i_B,
        i_C  => i_C,
        o_sum  => Carry_Save_Sum(VECTOR_WIDTH DOWNTO 0),
        o_cout => Carry_Save_Cout
    );
    Carry_save_Sum(SIZE) <= '0';
Ripple_Carry_Inst: entity work.eightBit_FA
    port map(
        i_A  => Carry_Save_Cout,
        i_B  => Carry_Save_Sum(SIZE DOWNTO 1),
        o_S  => Ripple_Carry_Sum
    );

o_sum(0) <= Carry_Save_Sum(0); 
o_sum(SIZE DOWNTO 1) <= Ripple_Carry_Sum(VECTOR_WIDTH DOWNTO 0); -- use ADDER_SIZE - 1 to avoid adding the last bit of Ripple Carry as that is the COUT   
o_carry <= Ripple_Carry_Sum(SIZE);
o_sum(OUTPUT_SIZE) <= Ripple_Carry_Sum(SIZE);

end Behavioral;

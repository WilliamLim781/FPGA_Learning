----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2025 12:52:30 PM
-- Design Name: 
-- Module Name: Full_adder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_adder is
    Port ( i_A : in STD_LOGIC;
           i_B : in STD_LOGIC;
           i_Cin : in STD_LOGIC;
           o_Cout : out STD_LOGIC;
           o_S : out STD_LOGIC);
end Full_adder;

architecture Behavioral of Full_adder is
begin

    o_S <= i_A xor i_B xor i_Cin;
    o_Cout  <= (i_A AND i_B) OR (i_Cin AND(i_A XOR i_B));

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/28/2025 03:57:40 PM
-- Design Name: 
-- Module Name: Frequency_divider_TB - Behavioral
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

entity Frequency_divider_TB is
--  Port ( );
end Frequency_divider_TB;

architecture Behavioral of Frequency_divider_TB is
    signal i_clk : std_logic := '0';
    signal i_rst : std_logic := '0';
    signal o_en  : std_logic;
begin

uut: entity work.Frequency_divider
port map (
    clk => i_clk,
    rst => i_rst,
    clk_en => o_en
);

-- Clock: 100 MHz
clk_process : process
begin
    i_clk <= '0';
    wait for 5 ns;
    i_clk <= '1';
    wait for 5 ns;
end process;
process is
begin
  i_rst <= '1';
  wait for 10 ns;
  i_rst <= '0';
  wait;

end process;

end Behavioral;

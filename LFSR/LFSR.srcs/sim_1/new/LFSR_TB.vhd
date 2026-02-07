----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/25/2026 12:56:58 PM
-- Design Name: 
-- Module Name: LFSR_TB - Behavioral
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

entity LFSR_TB is
--  Port ( );
end LFSR_TB;

architecture Behavioral of LFSR_TB is
    signal r_clk : std_logic :='0';
    signal r_en : std_logic :='1';
    signal w_out :std_logic_vector( 2 downto 0);
begin

UUT: entity work.Shift_Reg
    port map(
        i_data => r_en,
        i_clk => r_clk,
        o_shiftRegMuti => w_out
    );
    
    process(r_clk) is 
    begin
        r_clk <= not r_clk after 10 ns;
    end process;
    
    process is
    begin
        wait;
    end process;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2026 06:05:04 PM
-- Design Name: 
-- Module Name: Counter_sim - Behavioral
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

entity Counter_sim is
--  Port ( );
end Counter_sim;

architecture Behavioral of Counter_sim is
    signal r_en  : std_logic;
    signal w_out : std_logic_vector(3 downto 0);
    signal r_clk : std_logic := '0';
    signal w_msb :std_logic;
begin

UUT: entity work.counter
    port map(
        i_en => r_en,
        i_clk => r_clk,
        o_counter => w_out,
        o_MSB_detect => w_msb 
    );
    process(r_clk)is 
    begin
        r_clk <= not r_clk after 10 ns;
    end process;
    
    process is
    begin
        r_en <= '1';
        wait for 150ns;
        wait;
    end process;

end Behavioral;

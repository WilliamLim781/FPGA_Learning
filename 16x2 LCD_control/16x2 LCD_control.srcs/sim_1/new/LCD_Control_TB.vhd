----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/28/2025 01:10:41 PM
-- Design Name: 
-- Module Name: LCD_Control_TB - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use work.LCD_Control_pkg.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LCD_Control_TB is
--  Port ( );
end LCD_Control_TB;

architecture Behavioral of LCD_Control_TB is
    signal r_in1 : std_logic_vector(MESSAGE_SIZE - 1 DOWNTO 0);
    signal r_done: std_logic;
    signal r_clk : std_logic := '0';
    signal r_rst : std_logic;
    signal w_data : std_logic_vector(MESSAGE_SIZE - 1 DOWNTO 0);
    signal r_en   : std_logic;
begin

uut:entity work.LCD_Control
    port map(
        i_data => r_in1,
        i_done => r_done,
        i_clk  => r_clk,
        i_rst  => r_rst,
        O_DATA => w_data,
        o_en   => r_en
    );
    process (r_clk) is 
    
    begin
        r_clk <= not r_clk after 8 ns ;
    end process;
    
    process is 
        
    begin

        r_rst <= '1';
        wait for 100 ns;
        r_rst <= '0';
        wait; 
    end process;
end Behavioral;

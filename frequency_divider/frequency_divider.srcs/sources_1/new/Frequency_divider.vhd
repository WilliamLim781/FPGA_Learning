----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/28/2025 03:36:54 PM
-- Design Name: 
-- Module Name: Frequency_divider - Behavioral
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

entity Frequency_divider is
    generic(
        CONSTANT size : integer := 2
    );
    Port (
        clk   : in std_logic;
        rst   : in std_logic;
        clk_en: out std_logic
        
    );
end Frequency_divider;

architecture Behavioral of Frequency_divider is
    signal d : std_logic_vector(size downto 0);
    signal q : std_logic_vector(size downto 0);
begin

    d <= NOT q;
    
    dff_inst0: entity work.d_FF
    port map(
        clk => clk,
        rst => rst,
        d   => d(0),
        q   => q(0)
    );
    Freq_div : for i in 1 to size generate
        DDF_INST : entity work.d_FF
            port map(
                clk => q(i - 1),
                rst => rst,
                d   => d(i),
                q   => q(i)
            );
    end generate Freq_div;
    clk_en <= q(size);
end Behavioral;

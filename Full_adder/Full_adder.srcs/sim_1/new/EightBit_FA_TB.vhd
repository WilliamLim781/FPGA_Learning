----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2025 04:16:29 PM
-- Design Name: 
-- Module Name: EightBit_FA_TB - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity EightBit_FA_TB is
end EightBit_FA_TB;

architecture Behavioral of EightBit_FA_TB is
    signal r_In1, r_In2 : std_logic_vector (63 downto 0);
    signal w_out        : std_logic_vector (64 downto 0);
begin

UUT: entity work.EightBit_FA
port map(
    i_A => r_In1,
    i_B => r_In2,
    o_S => w_out
);

process is 
begin 

for i in 255 to 510 loop
    for j in 255 to 510 loop  
        r_In1 <= std_logic_vector(TO_UNSIGNED(i,64));
        r_In2 <= std_logic_vector(TO_UNSIGNED(j,64));
        wait for 10 ps; -- time for propagation
        assert unsigned(w_out) = i + j
            severity failure;
    end loop;
end loop;

report " all 65536 combinations passed!" severity note;
wait; -- end simulation 
end process;
end Behavioral;

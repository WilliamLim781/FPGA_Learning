----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2026 02:05:03 PM
-- Design Name: 
-- Module Name: Carry_Save_Adder_TB - Behavioral
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

entity Carry_Save_Adder_TB is
--  Port ( );
end Carry_Save_Adder_TB;

architecture Behavioral of Carry_Save_Adder_TB is

signal r_A,r_B,r_C : std_logic_vector( 3 downto 0);
signal w_Sum : std_logic_vector(5 DOWNTO 0);
signal w_Carry : std_logic;


begin

UUT: entity work.Carry_Save_adder
port map(
        i_A     => r_A,  
        i_B     => r_B,
        i_c   => r_C,
        o_sum   => w_Sum,
        o_carry => w_Carry
);

process is
begin

for i in 0 to 15 loop
    for j in 0 to 15 loop
        for k in 0 to 15 loop
            r_A <= std_logic_vector(TO_UNSIGNED(i,4));
            r_B <= std_logic_vector(TO_UNSIGNED(j,4));
            r_C <= std_logic_vector(TO_UNSIGNED(K,4));
            wait for 100 ps;
            assert unsigned(w_Sum) = i+j+k
                severity failure; 
        end loop;
    end loop;
end loop;
wait;
report "passed" severity note;
end process;


end Behavioral;

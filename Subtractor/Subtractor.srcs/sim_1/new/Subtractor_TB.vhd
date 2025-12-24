----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2025 09:24:09 PM
-- Design Name: 
-- Module Name: Subtractor_TB - Behavioral
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

entity Subtractor_TB is

end Subtractor_TB;

architecture Behavioral of Subtractor_TB is
    SIGNAL r_in1 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL r_in2 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL w_out :  STD_LOGIC_VECTOR(63 DOWNTO 0);
begin

UUT: entity work.N_Bit_Subtractor
    port map(
        i_A_N   => r_in1,
        i_B_N   => r_in2,
        o_S_N   => w_out,
        i_sub   => '1'
    );
    
process is
begin

for i in -128 to 127 loop
    for j in -128 to 127 loop
        r_in1 <= std_logic_vector(to_signed(i, 64));
        r_in2 <= std_logic_vector(to_signed(j, 64));
        wait for 10 ps;
        assert signed(w_out) = to_signed(i - j,64)
            severity failure;
    end loop;
end loop;

report "all test were passed " 
    severity note;
wait;
end process;
    

end Behavioral;

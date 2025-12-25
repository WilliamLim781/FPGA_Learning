----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/25/2025 01:41:50 PM
-- Design Name: 
-- Module Name: Multiplier_TB - Behavioral
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
use work.global_cfg.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplier_TB is
--  Port ( );
end Multiplier_TB;

architecture Behavioral of Multiplier_TB is
   signal r_in1 : std_logic_vector(MULT_SIZE - 1 downto 0);
   signal r_in2 : std_logic_vector(MULT_SIZE - 1  downto 0);
   signal w_out : std_logic_vector(2*MULT_SIZE - 1  downto 0);
    
begin

    UUT:entity work.Multiplier
        port map(
            i_a => r_in1,
            i_b => r_in2,
            o_s => w_out

        );


    process is 
    begin
        
        -- automate test
        for i in 0 to MULT_SIZE  loop
            for j in 0 to MULT_SIZE  loop
                r_in1 <= std_logic_vector(to_unsigned(i,MULT_SIZE));
                r_in2 <= std_logic_vector(to_unsigned(j,MULT_SIZE));
                wait for 750 ps;
                assert(unsigned(w_out)) = i * j
                    severity failure;
            end loop;
        end loop;
        
        report " all test have been passed" 
            severity note;
        wait;
    end process ;
end Behavioral;

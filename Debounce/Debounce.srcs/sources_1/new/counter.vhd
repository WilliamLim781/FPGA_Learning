----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2026 05:41:16 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter is
    generic(
        NUM_BITS: integer := 4);
        
    Port ( i_en : in STD_LOGIC;
           i_clk : in STD_LOGIC;
           o_counter : out STD_LOGIC_vector(NUM_BITS - 1 DOWNTO 0);
           o_MSB_detect: out STD_LOGIC;
           O_TEST      : OUT std_logic
           );

end counter;

architecture Behavioral of counter is
    signal count : unsigned(NUM_BITS - 1 DOWNTO 0) := (others => '0'); 
begin

    process(i_clk) is 
        variable msb : std_logic;
    begin 
        if rising_edge(i_clk) then      --execute counter when at rising edge of clock
            if (i_en = '1') then        --enable pin to turn on an off counting             
                if(count = (2**NUM_BITS) - 1) then 
                    msb := '1';              
                    count <= (others => '0');
                else
                    count <= count + 1;
                    msb := '0';
                end if;
            end if;
            o_counter <= std_logic_vector(count);
            o_MSB_detect <= msb;   
        end if;
    end process;

end Behavioral;

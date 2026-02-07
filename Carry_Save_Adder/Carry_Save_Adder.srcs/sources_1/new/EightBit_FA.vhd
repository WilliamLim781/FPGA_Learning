----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2025 02:59:23 PM
-- Design Name: 
-- Module Name: EightBit_FA - Behavioral
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

entity EightBit_FA is
    generic(
        ADDER_SIZE: integer := 64
    );
    Port ( i_A     : in  STD_LOGIC_VECTOR(ADDER_SIZE - 1  downto 0);
           i_B     : in  STD_LOGIC_VECTOR(ADDER_SIZE - 1 downto 0);
           o_S     : out STD_LOGIC_VECTOR(ADDER_SIZE     downto 0)
          );
end EightBit_FA;

architecture Behavioral of EightBit_FA is
    signal carry : STD_LOGIC_VECTOR(ADDER_SIZE downto 0);
begin

carry(0) <= '0';

FA_8Bit : for i in 0 to ADDER_SIZE - 1  generate
    FA_inst: entity work.Full_adder
        port map(
            i_A   => i_A(i),
            i_B   => i_B(i),
            i_Cin => carry(i),
            o_S   => o_S(i),
            o_Cout => carry(i + 1)
        );
    end generate FA_8Bit;
    
o_S(ADDER_SIZE) <= carry(ADDER_SIZE);

end Behavioral;

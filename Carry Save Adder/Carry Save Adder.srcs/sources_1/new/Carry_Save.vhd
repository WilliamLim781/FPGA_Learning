----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2026 12:56:18 PM
-- Design Name: 
-- Module Name: Carry_Save - Behavioral
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
use work.global_cfg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Carry_Save is
    generic(
        ADDER_SIZE: integer := SIZE
    );
  Port ( 
    i_A    : in std_logic_vector(VECTOR_WIDTH DOWNTO 0);
    i_B    : in std_logic_vector(VECTOR_WIDTH DOWNTO 0);
    i_c    : in std_logic_vector(VECTOR_WIDTH DOWNTO 0);
    o_sum  : out std_logic_vector(VECTOR_WIDTH DOWNTO 0);
    o_cout : out std_logic_vector(VECTOR_WIDTH DOWNTO 0)
  );
end Carry_Save;

architecture Behavioral of Carry_Save is

begin
FA : for i in 0 to VECTOR_WIDTH generate
    FA_inst: entity work.Full_Adder
    port map(
        i_A => i_A(i),
        i_B => i_B(i),
        i_Cin => i_c(i),
        o_S => o_sum(i),
        o_Cout => o_cout(i) 
    );
end generate FA;

end Behavioral;

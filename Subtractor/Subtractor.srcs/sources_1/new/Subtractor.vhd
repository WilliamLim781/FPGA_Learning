----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2025 07:47:09 PM
-- Design Name: 
-- Module Name: Subtractor - Behavioral
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

entity One_Bit_Subtractor is
    Port ( i_A : in STD_LOGIC;
           i_B : in STD_LOGIC;
           i_Cin : in STD_LOGIC;
           i_sub : in STD_LOGIC;
           o_S : out STD_LOGIC;
           o_Cout : out STD_LOGIC);
end One_Bit_Subtractor;

architecture Behavioral of One_Bit_Subtractor is
    signal w_B : std_logic;
begin
w_B <= i_B xor i_sub;
o_S <= i_A xor w_B xor i_cin;
o_Cout <= ( i_A and w_B) or (i_cin and (i_A xor w_B));

end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity N_Bit_Subtractor is
    generic(
        SUBTRACTOR_SIZE : integer := 64
    );
    Port ( i_A_N    : in std_logic_vector( SUBTRACTOR_SIZE - 1 downto 0);
           i_B_N    : in std_logic_vector( SUBTRACTOR_SIZE - 1 downto 0);
           i_Sub    : in std_logic;
           o_S_N    : out std_logic_vector( SUBTRACTOR_SIZE - 1 downto 0));
end N_Bit_Subtractor;

architecture Behavioral of N_Bit_Subtractor is
    signal w_B : std_logic_vector( SUBTRACTOR_SIZE - 1 downto 0);
    signal carry : std_logic_vector( SUBTRACTOR_SIZE downto 0);
begin
    carry(0) <=  i_Sub; -- selects whether or not to subtract
    
    Sub_Gen : for i in 0 to SUBTRACTOR_SIZE - 1 generate
        SUB_inst: entity work.One_Bit_subtractor
            port map(
                i_A => i_A_N(i),
                i_B => i_B_N(i),
                i_Cin => carry(i),
                i_Sub => i_Sub,
                o_S => o_S_N(i),
                o_cout => carry( i + 1 )
            );
    end generate;
end Behavioral;



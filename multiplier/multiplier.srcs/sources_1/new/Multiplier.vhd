----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/25/2025 09:53:45 AM
-- Design Name: 
-- Module Name: Multiplier - Behavioral
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.global_cfg.all;


entity Multiplier is
    generic(
        N : positive := MULT_SIZE
    );
  Port (
    i_a    : in std_logic_vector(N - 1 DOWNTO 0);
    i_b    : in std_logic_vector(N - 1 DOWNTO 0);
    o_s    : out std_logic_vector((2*N - 1) DOWNTO 0)
   );
end Multiplier;
   
architecture Behavioral of Multiplier is    
    signal product  : unsigned( WIDTH - 1 downto 0);
begin

-- start with creating the partial products
process(i_a,i_b)
    variable sum : unsigned (WIDTH downto 0);
    variable partial_products: unsigned(WIDTH  downto 0);
    variable lvl : unsigned(WIDTH  downto 0); -- lvl is the current partial product. that includes the shifting
begin
    sum := (others => '0');
    for i in 0 to DEPTH - 1  loop
        partial_products := (others => '0'); -- reset the variable to hold current partial product to 0 so it can be reused
        for j in 0 to DEPTH - 1 loop
            partial_products(j) := i_a(j) AND i_b(i);          
        end loop;
            lvl := shift_left(unsigned(partial_products), i);
            -- adding up the partial products together as they are generated
            sum := sum + lvl;
    end loop;
    o_s <= std_logic_vector(sum); -- all the sums added together become the final product 
end process;






end Behavioral;

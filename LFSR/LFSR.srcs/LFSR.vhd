library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity LFSR is 
    generic(
        N : positive := 8
    );
    port(
        i_en    :  in std_logic
        i_clk   :  in std_logic
    );
end LFSR;

architecture Behavioral of LFSR is 
    signal r_shiftReg : std_logic_vector(N - 1 downto 0)
begin
    process(i_clk)
        if(rising_edge(i_clk)) then
            if(i_en)
                
            end if;
        end if;
    end process;
end Behavioral;


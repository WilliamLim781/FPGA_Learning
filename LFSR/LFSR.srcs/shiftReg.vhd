library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;  

entity Shift_Reg is
    generic(
        SIZE : positive := 8
    );
    port map(
        --i_en : in std_logic optional to turn off the shift register when not in use
        i_clk         : in std_logic
        i_data        : in std_logic
       -- o_shiftReg    : out std_logic -- if only the last output is desired you can uncomment this and the other relevant comments
        o_shiftRegMuti: out std_logic_vector(SIZE - 1 downto 0) -- allows for more than one FF output to be read
    );

end Shift_Reg

architecture Behavioral of Shift_Reg is
    signal r_shift : std_logic_vector (size - 1 downto 0);
begin
    process(i_clk)
        if rising_edge(i_clk)
            r_shift(0) <= i_data;
            r_shift(SIZE - 1 downto 1) <= r_shift(SIZE - 2 downto 0); -- preforms the shift every clock cycle
        end if;
    end process;
    o_shiftRegMuti <= r_shift;
    
end Behavioral
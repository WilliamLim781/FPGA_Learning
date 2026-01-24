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
    signal r_shiftRegOut : std_logic_vector(N - 1 downto 0)
    signal ShiftRegBit1  : std_logic := '1'
begin
    Shift_reg: entity work.shiftReg
        port map(
            i_clk => i_clk,
            i_data  => ShiftRegBit1,
            o_shiftRegMuti => r_shiftRegOut
        );
        ShiftRegBit1 <= r_shiftRegOut(N - 1) XOR r_shiftRegOut(N - 2);
end Behavioral;


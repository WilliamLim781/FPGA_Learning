---------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/27/2025 03:47:11 PM
-- Design Name: 
-- Module Name: LCD_Control - Behavioral
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
use work.LCD_Control_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LCD_Control is
    Port ( i_data: in STD_LOGIC_Vector(MESSAGE_SIZE - 1 downto 0);   -- read buttons to form data
          -- i_RS  : in std_logic;                                  -- Register select to pick what type of operations are done (switch)
           --i_RW  : in std_logic;                                -- Read/write select (switch) don't have enough inputs to give RW its own button
           i_done  : in std_logic;                                -- for the enable pin when data is ready to transfer enable will be toggled
           i_clk : in std_logic;                                  -- clock source for timing (internal component of FPGA dev board)
           i_rst : in std_logic;
           o_data: out STD_LOGIC_VECTOR (MESSAGE_SIZE - 1 DOWNTO 0);  -- data to be sent to LCD 
           o_RS  : out std_logic; -- output still needs to be assigned
           o_en  : out std_logic;
           o_RW  : out std_logic
           );                                   
end LCD_Control;

architecture Behavioral of LCD_Control is
    signal rst_active: std_logic;
    signal sel : unsigned(2 downto 0) := (others => '0');
    signal slow_en    : std_logic;
    signal slow_en_d  : std_logic; -- edge detection
    signal slow_en_toggle: std_logic := '0';
    signal Eight_bit_data    : std_logic_vector(message_size - 1 downto 0);
    
begin

    o_RW <= '0';  -- right now there is only plans for writting so the pin is hardwired to '0' for write
    
    slow_clk_en: entity work.Frequency_divider
    port map(
        clk => i_clk,
        rst => i_rst,
        clk_en => slow_en
    );

 
   
   
    Timing:
    process(i_clk,i_rst)
    begin
        if rising_edge(i_clk) then
            slow_en_d <= slow_en;   
            if(i_rst = '1') then
                sel <= (others => '0'); -- reset sel counter
                rst_active <= '1';
            end if;
            -- this section handles the reset operations
            if rst_active = '1' then            
                if slow_en_d = '0' AND slow_en = '1' then
                    slow_en_toggle <= not slow_en_toggle;
                end if;
                if slow_en_toggle = '1' then
                    sel <= sel + 1;
                    slow_en_toggle <= '0';
                end if;
             else
                 if slow_en_d = '0' AND slow_en = '1' then
                    slow_en_toggle <= not slow_en_toggle;
                end if;
                if slow_en_toggle = '1' then
                    Eight_bit_data <= i_data;
                    slow_en_toggle <= '0';
                    sel <= "110";
                end if;                             
            end if;         
            if sel = "101" then
                rst_active <= '0'; -- stop reset sequence
            end if;         
        end if;
    end process Timing;
    
    -- this section handles the multiplexor that will decide what messages will be send to the LCD
    with sel select
        o_data <= FUNCTION_SET when "001",
              CLEAR_DISPLAY when "010", 
              RETURN_HOME when "011" ,
              DISPLAY_ONOFF when "100",
              ENTRY_MODE_SET when "101",
              Eight_bit_data when "110",
              x"00"          when others;  
end Behavioral;

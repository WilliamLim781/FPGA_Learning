----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/27/2025 05:48:50 PM
-- Design Name: 
-- Module Name: LCD_Control_pkg - Behavioral
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
package lcd_Control_pkg is

    --# of commands for reset procedure
    CONSTANT RESET_PROCEDURE_SIZE : integer := 5;
    
    --
    CONSTANT MESSAGE_SIZE : integer := 8;

    -- LCD commands
     CONSTANT FUNCTION_SET : std_logic_vector(7 downto 0) := x"3F";
     CONSTANT CLEAR_DISPLAY : std_logic_vector(7 downto 0) := x"01";
     CONSTANT RETURN_HOME : std_logic_vector(7 downto 0) := x"03";
     CONSTANT DISPLAY_ONOFF : std_logic_vector(7 downto 0) := x"0F";
     CONSTANT ENTRY_MODE_SET : std_logic_vector(7 downto 0) := x"06";
     
     -- lcd reset command table
     type RESET_COMMAND_TABLE is array (0 to RESET_PROCEDURE_SIZE - 1) of std_logic_vector( MESSAGE_SIZE - 1 DOWNTO 0);
     CONSTANT RESET_INIT_TABLE : RESET_COMMAND_TABLE := (
        0 => FUNCTION_SET,
        1 => CLEAR_DISPLAY,
        2 => RETURN_HOME,
        3 => DISPLAY_ONOFF,
        4 => ENTRY_MODE_SET    
     ); 
     
end package lcd_Control_pkg;

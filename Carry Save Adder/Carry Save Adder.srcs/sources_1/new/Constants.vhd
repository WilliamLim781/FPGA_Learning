----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2026 03:13:10 PM
-- Design Name: 
-- Module Name: Constants - Behavioral
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

package global_cfg is
    CONSTANT SIZE   : INTEGER := 4;
    CONSTANT VECTOR_WIDTH : INTEGER := SIZE - 1;
    CONSTANT OUTPUT_SIZE  : INTEGER := SIZE + 1;
end package;

package body global_cfg is

end package body;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/25/2025 10:24:33 AM
-- Design Name: 
-- Module Name: constants - Behavioral
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

package global_cfg is 
    CONSTANT MULT_SIZE: positive := 32;
    CONSTANT WIDTH    : positive := MULT_SIZE * 2 - 1;
    CONSTANT DEPTH    : positive := MULT_SIZE ;
end package;

package body global_cfg is
end package body;
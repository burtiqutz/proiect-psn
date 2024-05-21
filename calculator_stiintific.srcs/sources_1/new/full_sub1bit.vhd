----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2024 06:50:16 PM
-- Design Name: 
-- Module Name: full_sub1bit - Behavioral
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

entity full_sub1bit is
    Port ( SAIN : in  STD_LOGIC;
           SBIN : in  STD_LOGIC;
           SCIN : in  STD_LOGIC;
           SSO : out  STD_LOGIC;
           SCO : out  STD_LOGIC);
end full_sub1bit;

architecture Behavioral of full_sub1bit is

begin
SSO<=SAIN XOR SBIN XOR SCIN;
SCO<=(NOT SAIN AND SBIN ) OR (SCIN AND(NOT SAIN XOR SBIN));

end Behavioral;

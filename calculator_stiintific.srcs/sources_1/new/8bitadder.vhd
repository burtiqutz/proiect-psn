----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 10:00:30 AM
-- Design Name: 
-- Module Name: 8bitadder - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bitadder is
  Port ( a : in std_logic_vector (7 downto 0);
         b : in std_logic_vector (7 downto 0);
         cin : in std_logic;
         cout: out std_logic;
         result : out std_logic_vector (7 downto 0));
end bitadder;

architecture Behavioral of bitadder is

signal temp : std_logic_vector (8 downto 0);

component full_adder1bit is
    Port ( A : in std_logic ;
           B : in  std_logic;
           SUM : out  std_logic;
           CIN : in  std_logic;
           COUT : out  std_logic);
end component full_adder1bit;

begin

temp(0) <= cin;
et: for i in 0 to 7 generate
        et2: full_adder1bit port map (A => a(i), B=> b(i), sum => result(i), cin => temp(i), cout => temp(i + 1));
    end generate;
 

end Behavioral;

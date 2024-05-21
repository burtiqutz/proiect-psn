----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2024 06:51:48 PM
-- Design Name: 
-- Module Name: full_sub8bit - Behavioral
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

entity full_sub8bit is
    Port ( A : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           B : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           R : out  STD_LOGIC_VECTOR(7 DOWNTO 0);
           Z : out  STD_LOGIC);
end full_sub8bit;

architecture Behavioral of full_sub8bit is

signal SCX:STD_LOGIC_VECTOR(7 downto 1);
constant low :STD_LOGIC:='0';

component full_sub1bit is
    Port ( SAIN : in  STD_LOGIC;
           SBIN : in  STD_LOGIC;
           SCIN : in  STD_LOGIC;
           SSO : out  STD_LOGIC;
           SCO : out  STD_LOGIC);
end component;

begin
--puteam sa fac cu for generate
e1:full_sub1bit port map (SAIN=>A(0),SBIN=>B(0),SCIN=>LOW,SCO=>SCX(1),SSO=>R(0));
e2:full_sub1bit port map (SAIN=>A(1),SBIN=>B(1),SCIN=>SCX(1),SCO=>SCX(2),SSO=>R(1));
e3:full_sub1bit port map (SAIN=>A(2),SBIN=>B(2),SCIN=>SCX(2),SCO=>SCX(3),SSO=>R(2));
e4:full_sub1bit port map (SAIN=>A(3),SBIN=>B(3),SCIN=>SCX(3),SCO=>SCX(4),SSO=>R(3));
e5:full_sub1bit port map (SAIN=>A(4),SBIN=>B(4),SCIN=>SCX(4),SCO=>SCX(5),SSO=>R(4));
e6:full_sub1bit port map (SAIN=>A(5),SBIN=>B(5),SCIN=>SCX(5),SCO=>SCX(6),SSO=>R(5));
e7:full_sub1bit port map (SAIN=>A(6),SBIN=>B(6),SCIN=>SCX(6),SCO=>SCX(7),SSO=>R(6));
e8:full_sub1bit port map (SAIN=>A(7),SBIN=>B(7),SCIN=>SCX(7),SCO=>Z,SSO=>R(7));

end Behavioral;

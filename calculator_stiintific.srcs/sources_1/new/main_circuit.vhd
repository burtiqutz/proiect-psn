----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 10:12:01 AM
-- Design Name: 
-- Module Name: main_circuit - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main_circuit is
  Port ( clk : in std_logic;
         a : in std_logic_vector(7 downto 0);
         b : in std_logic_vector(7 downto 0);
         btn : in std_logic_vector (3 downto 0);
         result : inout std_logic_vector (15 downto 0);
         an : out std_logic_vector (7 downto 0);
         cat : out std_logic_vector(6 downto 0));
end main_circuit;

architecture Behavioral of main_circuit is

component ALU is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           btn : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           res : out STD_LOGIC_VECTOR (15 downto 0)
           );
end component ALU;

component SSD is
    Port ( clk: in STD_LOGIC;
           digits: in STD_LOGIC_VECTOR(31 downto 0);
           an: out STD_LOGIC_VECTOR(7 downto 0);
           cat: out STD_LOGIC_VECTOR(6 downto 0));
end component SSD;

component debouncer is
    Port ( Clk : in STD_LOGIC;
           D_in : in STD_LOGIC;
           Q_out : out STD_LOGIC);
end component;

signal outputDisplay : std_logic_vector (31 downto 0);
signal operation : std_logic_vector (3 downto 0);

begin

impartireBtn:debouncer port map(clk =>clk,D_in => btn(3),Q_out => operation(3));
inmultireBtn:debouncer port map(clk =>clk,D_in =>btn(2),Q_out => operation(2));
adunareBtn:debouncer port map(clk => clk,D_in => btn(1),Q_out => operation(1));
scadereBtn:debouncer port map(clk => clk,D_in => btn(0),Q_out => operation(0));

et1: ALU port map (a => a, b => b, btn => btn, clk => clk, res => result);
outputDisplay <= a & b & result;
et2: SSD port map (clk => clk, digits => outputDisplay, an => an, cat => cat);
end Behavioral;

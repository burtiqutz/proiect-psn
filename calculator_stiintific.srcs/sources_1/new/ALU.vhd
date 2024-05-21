----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 10:38:20 AM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           btn : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           an : out std_logic_vector (7 downto 0);
           cat : out std_logic_vector(6 downto 0)
           );
end ALU;

architecture Behavioral of ALU is

signal output : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');

signal sumOutput : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal sumOutput_8bit : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');

signal subOutput : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal subOutput_8bit : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');

signal mulOutput : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');

signal divOutput : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal divOutput_8bit : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal remainder_8bit : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');

signal carryOut : STD_LOGIC;
signal Borrow : STD_LOGIC;

component bitadder is
  Port ( a : in std_logic_vector (7 downto 0);
         b : in std_logic_vector (7 downto 0);
         cin : in std_logic;
         cout: out std_logic;
         result : out std_logic_vector (7 downto 0));
end component bitadder;

component full_sub8bit is
    Port ( A : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           B : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           R : out  STD_LOGIC_VECTOR(7 DOWNTO 0);
           Z : out  STD_LOGIC);
end component full_sub8bit;

component inmultire is
  Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
         b : in STD_LOGIC_VECTOR (7 downto 0);
         result : out STD_LOGIC_VECTOR (15 downto 0));
end component inmultire;

component divider8 is
    Port ( 
           clk : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           B : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           Q : out  STD_LOGIC_VECTOR(7 DOWNTO 0);
           R : out  STD_LOGIC_VECTOR(7 DOWNTO 0));
end component divider8;

component debouncer is
    Port ( Clk : in STD_LOGIC;
           D_in : in STD_LOGIC;
           Q_out : out STD_LOGIC);
end component;

component SSD is
    Port ( clk: in STD_LOGIC;
           digits: in STD_LOGIC_VECTOR(31 downto 0);
           an: out STD_LOGIC_VECTOR(7 downto 0);
           cat: out STD_LOGIC_VECTOR(6 downto 0));
end component SSD;

signal operation : std_logic_vector (3 downto 0);
signal outputDisplay : std_logic_vector (31 downto 0);
begin
adunare: bitadder port map (a => a, b => b, cin => '0', cout => carryOut, result => sumOutput_8bit);

scadere: full_sub8bit port map (A => a, B => b, R => subOutput_8bit, Z => Borrow);

multiply: inmultire port map (a => a,
                              b => b,
                              result => mulOutput
                              );
impartire: divider8 port map(
                            clk => clk,
                            A => a,
                            B => b,
                            Q => divOutput_8bit,
                            R => remainder_8bit
                            );
                            
sumOutput <= "00000000" & sumOutput_8bit;
subOutput <= "00000000" & subOutput_8bit;
divOutput <= "00000000" & divOutput_8bit;

impartireBtn:debouncer port map(clk =>clk,D_in => btn(3),Q_out => operation(3));
inmultireBtn:debouncer port map(clk =>clk,D_in =>btn(2),Q_out => operation(2));
adunareBtn:debouncer port map(clk => clk,D_in => btn(1),Q_out => operation(1));
scadereBtn:debouncer port map(clk => clk,D_in => btn(0),Q_out => operation(0));

with btn select
               output <= sumOutput when "1000",
                            subOutput when "0100",
                            mulOutput when "0010",
                            divOutput when "0001",
                            (others => '0') when others;                    
                             
outputDisplay <= a & b & output;

afisare: SSD port map (clk => clk, digits => outputDisplay, an => an, cat => cat);
end Behavioral;

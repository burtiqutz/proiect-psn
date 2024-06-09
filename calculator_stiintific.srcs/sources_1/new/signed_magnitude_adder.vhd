library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- For unsigned arithmetic operations
use IEEE.NUMERIC_STD.ALL;
entity signed_magnitude_adder is
    Port (
        A : in  STD_LOGIC_VECTOR (7 downto 0); -- First 8-bit signed magnitude input
        B : in  STD_LOGIC_VECTOR (7 downto 0); -- Second 8-bit signed magnitude input
        Sum : out  STD_LOGIC_VECTOR (7 downto 0)); -- 8-bit signed magnitude sum
end signed_magnitude_adder;

architecture Behavioral of signed_magnitude_adder is
    signal A_mag, B_mag : STD_LOGIC_VECTOR (6 downto 0);
    signal A_sign, B_sign, Sum_sign : STD_LOGIC;
    signal Temp_sum : STD_LOGIC_VECTOR (6 downto 0);
    signal Sign_same : BOOLEAN;
begin
    A_sign <= A(7);
    B_sign <= B(7);
    A_mag <= A(6 downto 0);
    B_mag <= B(6 downto 0);

    process(A, B, A_sign, B_sign, A_mag, B_mag)
    begin
        Sign_same <= (A_sign = B_sign);
        
        if Sign_same then
            Temp_sum <= std_logic_vector(unsigned(a_mag) + unsigned(b_mag)); 
            Sum_sign <= A_sign; -- Same as input sign
        else
            if A_mag >= B_mag then
                temp_sum <= std_logic_vector(unsigned(a_mag) - unsigned(b_mag)); 
                Sum_sign <= A_sign; -- Result takes the sign of the larger magnitude
            else
                temp_sum <= std_logic_vector(unsigned(b_mag) - unsigned(a_mag)); 
                Sum_sign <= B_sign; -- Result takes the sign of the larger magnitude
            end if;
            
        end if;
    end process;
    Sum <= Sum_sign & temp_sum;
end Behavioral;
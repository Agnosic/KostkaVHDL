library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity kostka is
    Port ( clk: in STD_LOGIC;
           Button : in STD_LOGIC;
           reset : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0)
    );
end kostka;
 
architecture dice of kostka is
type st_typ is (k0, k1, k2, k3, k4, k5, k6);
signal st_now, st_next: st_typ;
begin

    process (clk)
     begin
        if (reset = '1') then
           st_now <= k0;
        else 
            st_now <= st_next;
        end if;
    end process;
    
process(st_now)
  
     begin
        
    case st_now is
        when k1 => 
            if(button = '1') then
                seg <= "1111001";    
                                  
            else
                st_next <= k2;
            end if;
        when k2 => 
            if(button = '1') then
                seg <= "0100100";
            else
               st_next <= k3;
            end if;
      
        when k3 =>
            if(button = '1') then
                seg <= "0110000";
            else
                st_next <= k4;
            end if;
            

        when k4 =>
            if(button = '1') then
                seg <= "0011001";
            else
                st_next <= k5;
            end if;

                
        when k5  =>
            if(button = '1') then
                seg <= "0010010";
             else
                st_next <= k6;
             end if;

                
        when k6 => 
             if(button = '1') then
                seg <= "0000010";            
             else
                st_next <= k1; 
             end if;
            
        
        when k0 =>
            seg <= "0000000";
            st_next <= k1;
            
        when others => 
                seg <= "1111111";
    end case;
         
end process;
     
end dice;
entity FFJK is
port(	clk, j, k, p, c : in bit;
	q		: out bit
);
end FFJK;

architecture ckt of FFJK is
	signal qs : bit;
begin

	process(clk, p, c)
	begin

		if p = '0' then qs <= '1';
		elsif c = '0' then qs <= '0';
		elsif clk = '1' and clk'event then
			if j = '1' and k = '1' then qs <= not qs;
			elsif j = '1' and k = '0' then qs <= '1';
			elsif j = '0' and k = '1' then qs <= '0';
			end if;
		end if;
	end process;

	q <= qs; 

end ckt;
entity CircuitoX is
port(	entrada	: in bit;
	clock	: in bit;
	clear	: in bit;
	Z	: out bit_vector(3 downto 0)
);
end CircuitoX;

architecture ckt of CircuitoX is
component FFJK is
port(	clk, j, k, p, c : in bit;
	q		: out bit
);
end component;

	signal aux	: bit_vector(3 downto 0);
	signal sig	: bit_vector(3 downto 0);
	
begin

	aux(0) <= not entrada;

	chinela0 : FFJK
	port map(clock, entrada, aux(0), '1', '1', sig(0));

	aux(1) <= not sig(0);

	chinela1 : FFJK
 	port map(clock, sig(0), aux(1), '1', '1', sig(1));

	aux(2) <= not sig(1);

	chinela2 : FFJK
	port map(clock, sig(1), aux(2), '1', '1', sig(2));

	aux(3) <= not sig(2);

	chinela3 : FFJK
 	port map(clock, sig(2), aux(3), '1', '1', sig(3));

	Z(0) <= sig(0);
	Z(1) <= sig(1);
	Z(2) <= sig(2);
	Z(3) <= sig(3);


end ckt;

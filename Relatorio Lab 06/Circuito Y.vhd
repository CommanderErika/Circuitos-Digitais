entity CircuitoYy is
port(	A 	: in bit_vector(3 downto 0);
	e 	: in bit;
	clock	: in bit;
	clear	: in bit;
	saida	: out bit

);
end CircuitoYy;

architecture ckt of CircuitoYy is
component FFJK is
port(	clk, j, k, p, c : in bit;
	q		: out bit
);
end component;

	signal aux	: bit_vector(3 downto 0);
	signal qs	: bit_vector(3 downto 0);
	signal qs2	: bit_vector(2 downto 0);

begin

	aux(0) <= not(e and A(0));
	aux(1) <= not(e and A(1));
	aux(2) <= not(e and A(2));
	aux(3) <= not(e and A(3));

	chinela0 : FFJK
	port map(clock, '0', '1', aux(0), clear, qs(0));

	qs2(0) <= not qs(0);

	chinela1 : FFJK
	port map(clock, qs(0), qs2(0), aux(1), clear, qs(1));

	qs2(1) <= not qs(1);

	chinela2 : FFJK
	port map(clock, qs(1), qs2(1), aux(2), clear, qs(2));

	qs2(2) <= not qs(2);

	chinela3 : FFJK
	port map(clock, qs(2), qs2(2), aux(3), clear, qs(3));

	saida <= qs(3);

end ckt;

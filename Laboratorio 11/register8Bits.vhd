
	-- Registrador de 8 Bits --

entity Register8Bits is
port(	A	: in bit_vector(7 downto 0);
	clock	: in bit;
	clr	: in bit;
	B	: out bit_vector(7 downto 0)
);
end Register8Bits;

	-- Arquitetura do Registrador --

architecture ckt of Register8Bits is

	-- Componentes --

component FFD is
port( clk, D, P, C: in bit;
	q: out bit
);
end component;

	-- Sinais --


begin
	
	chinela0 : FFD
	port map(clock, A(0), '1', clr, B(0));

	chinela1 : FFD
	port map(clock, A(1), '1', clr, B(1));

	chinela2 : FFD
	port map(clock, A(2), '1', clr, B(2));

	chinela3 : FFD
	port map(clock, A(3), '1', clr, B(3));

	chinela4 : FFD
	port map(clock, A(4), '1', clr, B(4));

	chinela5 : FFD
	port map(clock, A(5), '1', clr, B(5));

	chinela6 : FFD
	port map(clock, A(6), '1', clr, B(6));

	chinela7 : FFD
	port map(clock, A(7), '1', clr, B(7));

end ckt;


	-- Registrador de 8 Bits --

entity Register10Bits is
port(	A	: in bit_vector(9 downto 0);
	I	: in bit_vector(9 downto 0);
	enable	: in bit;
	clock	: in bit;
	clr	: in bit;
	B	: out bit_vector(9 downto 0)
);
end Register10Bits;

	-- Arquitetura do Registrador --

architecture ckt of Register10Bits is

	-- Componentes --

component FFD is
port( clk, D, P, C: in bit;
	q: out bit
);
end component;

	-- Sinais --

	signal sig	: bit_vector(9 downto 0);


begin

	sig(0) <= enable nand I(0);
	sig(1) <= enable nand I(1);
	sig(2) <= enable nand I(2);
	sig(3) <= enable nand I(3);
	sig(4) <= enable nand I(4);
	sig(5) <= enable nand I(5);
	sig(6) <= enable nand I(6);
	sig(7) <= enable nand I(7);
	sig(8) <= enable nand I(8);
	sig(9) <= enable nand I(9);
	
	chinela0 : FFD
	port map(clock, A(0), sig(0), clr, B(0));

	chinela1 : FFD
	port map(clock, A(1), sig(1), clr, B(1));

	chinela2 : FFD
	port map(clock, A(2), sig(2), clr, B(2));

	chinela3 : FFD
	port map(clock, A(3), sig(3), clr, B(3));

	chinela4 : FFD
	port map(clock, A(4), sig(4), clr, B(4));

	chinela5 : FFD
	port map(clock, A(5), sig(5), clr, B(5));

	chinela6 : FFD
	port map(clock, A(6), sig(6), clr, B(6));

	chinela7 : FFD
	port map(clock, A(7), sig(7), clr, B(7));

	chinela8 : FFD
	port map(clock, A(8), sig(8), clr, B(8));

	chinela9 : FFD
	port map(clock, A(9), sig(9), clr, B(9));

end ckt;

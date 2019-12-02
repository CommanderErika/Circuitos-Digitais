
	-- Somador de 10 Bits --

entity Adder10Bits is
port(	A	: in bit_vector(9 downto 0);
	B	: in bit_vector(9 downto 0);
	Ci	: in bit;
	Co	: out bit;
	S	: out bit_vector(9 downto 0)
);
end Adder10Bits;


architecture ckt of Adder10Bits is

	-- Componentes --

component FullAdder is
port(	A, B	: in bit;
	Cin	: in bit;
	Sum	: out bit;
	Cout	: out bit
);
end component;

	-- Sinais --

	signal aux	: bit_vector(8 downto 0);

begin

	s0 : FullAdder
	port map(A(0), B(0), Ci, S(0), aux(0));

	s1 : FullAdder
	port map(A(1), B(1), aux(0), S(1), aux(1));

	s2 : FullAdder
	port map(A(2), B(2), aux(1), S(2), aux(2));

	s3 : FullAdder
	port map(A(3), B(3), aux(2), S(3), aux(3));

	s4 : FullAdder
	port map(A(4), B(4), aux(3), S(4), aux(4));

	s5 : FullAdder
	port map(A(5), B(5), aux(4), S(5), aux(5));

	s6 : FullAdder
	port map(A(6), B(6), aux(5), S(6), aux(6));

	s7 : FullAdder
	port map(A(7), B(7), aux(6), S(7), aux(7));

	s8 : FullAdder
	port map(A(8), B(8), aux(7), S(8), aux(8));

	s9 : FullAdder
	port map(A(9), B(9), aux(8), S(9), Co);

end ckt;

entity Adder6Bits is
port(	A, B	: in bit_vector(5 downto 0);
	Cin	: in bit;
	Cout	: out bit;
	S	: out bit_vector(5 downto 0)
);
end Adder6Bits;

architecture ckt of Adder6Bits is

component FullAdder is
port(	A, B	: in bit;
	Cin	: in bit;
	Sum	: out bit;
	Cout	: out bit
);
end component;

	signal sig	: bit_vector(5 downto 0);

begin

	adder0 : FullAdder
	port map(A(0), B(0), Cin, S(0), sig(0));

	adder1 : FullAdder
	port map(A(1), B(1), sig(0), S(1), sig(1));

	adder2 : FullAdder
	port map(A(2), B(2), sig(1), S(2), sig(2));

	adder3 : FullAdder
	port map(A(3), B(3), sig(2), S(3), sig(3));

	adder4 : FullAdder
	port map(A(4), B(4), sig(3), S(4), sig(4));

	adder5 : FullAdder
	port map(A(5), B(5), sig(4), S(5), sig(5));

	Cout <= sig(5);

end ckt;
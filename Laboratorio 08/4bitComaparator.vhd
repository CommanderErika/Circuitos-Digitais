---- Comaprador de 4 bits ----
--- Z é A igual a B   ----
--- X é A maior que B ----
--- Y é A menor que B ----


entity Comparator4Bits is
port(	A, B	: in bit_vector(3 downto 0);
	Z	: out bit;
	X	: out bit;
	Y	: out bit
);
end Comparator4Bits;

architecture ckt of Comparator4Bits is

	signal sig1	: bit_vector(7 downto 0);

begin
	sig1(0) <= not(A(0) xor B(0));
	sig1(1) <= not(A(1) xor B(1));
	sig1(2) <= not(A(2) xor B(2));
	sig1(3) <= not(A(3) xor B(3));

	Z <= sig1(0) and sig1(1) and sig1(2) and sig1(3);
	X <= (A(3) and (not B(3))) or (sig1(3) and A(2) and (not B(2))) or (sig1(3) and sig1(2) and A(1) and (not B(1))) or (sig1(3) and sig1(2) and sig1(1) and A(0) and (not B(0)));
	Y <= (B(3) and (not A(3))) or (sig1(3) and B(2) and (not A(2))) or (sig1(3) and sig1(2) and B(1) and (not A(1))) or (sig1(3) and sig1(2) and sig1(1) and B(0) and (not A(0)));

end ckt;

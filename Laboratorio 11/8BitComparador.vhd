---- Comaprador de 4 bits ----
--- Z é A igual a B   ----
--- X é A maior que B ----
--- Y é A menor que B ----
entity comparator8Bits is
port(	A	: in bit_vector(7 downto 0);
	B	: in bit_vector(7 downto 0);
	Z	: out bit;
	X	: out bit;
	Y	: out bit
);
end comparator8Bits;

architecture ckt of comparator8Bits is
component Comparator4Bits is
port(	A, B	: in bit_vector(3 downto 0);
	Z	: out bit;
	X	: out bit;
	Y	: out bit
);
end component;

	signal aux1	: bit_vector(2 downto 0);
	signal aux2	: bit_vector(2 downto 0);

begin
	
	Z <= aux1(0) and aux2(0);
	X <= aux1(1) or (aux1(0) and aux2(1));
	Y <= aux1(2) or (aux1(0) and aux2(2));

	
	comaprador0 : Comparator4Bits
	port map(A(7 downto 4), B(7 downto 4), aux1(0), aux1(1), aux1(2));

	comaprador1 : Comparator4Bits
	port map(A(3 downto 0), B(3 downto 0), aux2(0), aux2(1), aux2(2));
	

end ckt;

entity lab05 is
port(	B	: in bit_vector(6 downto 0);
	V	: out bit_vector(7 downto 0)
);
end lab05;


architecture ckt of lab05 is
--- BIN TO BCD ---
component lab03 is
port(	SW	: in bit_vector(7 downto 0);
	HEX0	: out bit_vector(3 downto 0);
	HEX1	: out bit_vector(3 downto 0);
	HEX2	: out bit_vector(3 downto 0)
);
end component;
--- ADDER 6 BITS ---
component Adder6Bits is
port(	A, B	: in bit_vector(5 downto 0);
	Cin	: in bit;
	Cout	: out bit;
	S	: out bit_vector(5 downto 0)
);
end component;
--- MUX 2x1 ---
component Mux2x1 is
port(	I0, I1	: in bit;
	s	: in bit;
	enable	: in bit;
	Y	: out bit
);
end component;

-- SIGNALS ---

	signal MuxToAdder	:	bit_vector(5 downto 0);
	signal sig		: 	bit_vector(5 downto 0);
	signal CoutAdder	: 	bit;
	signal AdderToBCD	:	bit_vector(7 downto 0);
	signal cen		:	bit_vector(3 downto 0);
	signal dec		:	bit_vector(3 downto 0);
	signal uni		:	bit_vector(3 downto 0);
	signal B2		:	bit_vector(6 downto 0);

begin

	B2(6 downto 0) <= not B(6 downto 0);

	mux0 : mux2x1
	port map(B(0), B2(0), B(6), '1', MuxToAdder(0));

	mux1 : mux2x1
	port map(B(1), B2(1), B(6), '1', MuxToAdder(1));

	mux2 : mux2x1
	port map(B(2), B2(2), B(6), '1', MuxToAdder(2));

	mux3 : mux2x1
	port map(B(3), B2(3), B(6), '1', MuxToAdder(3));

	mux4 : mux2x1
	port map(B(4), B2(4), B(6), '1', MuxToAdder(4));

	mux5 : mux2x1
	port map(B(5), B2(5), B(6), '1', MuxToAdder(5));

	--- Adder 6 bits ---

	sig(5 downto 0) <= "000000";

	adder : Adder6bits
	port map(MuxToAdder(5 downto 0), sig(5 downto 0), B(6), CoutAdder, AdderToBCD(5 downto 0));

	--- BIN TO BCD ---

	AdderToBCD(7 downto 6) <= "00";

	bcd : lab03
	port map(AdderToBCD(7 downto 0), uni(3 downto 0), dec(3 downto 0), cen(3 downto 0));

	V(3 downto 0) <= uni(3 downto 0);
	V(7 downto 4) <= dec(3 downto 0);

end ckt;

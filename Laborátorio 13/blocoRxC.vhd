entity blocoRxC is
port( 	Y	: in bit_vector(3 downto 0);
	C	: in bit_vector(3 downto 0);
	clk,clr	: in bit;
	ldc,ldr : in bit;
	Ys	: out bit_vector(3 downto 0);
	YxC	: out bit_vector(9 downto 0)
);
end blocoRxC;

architecture ckt of blocoRxC is
	-- Componentes --

component Registrador4Bits is
port(	A	: in bit_vector(3 downto 0);
	I	: in bit_vector(3 downto 0);
	clock	: in bit;
	clear	: in bit;
	enable	: in bit;
	B	: out bit_vector(3 downto 0)
);
end component;

component multi4Bits is
port(	A	: in bit_vector (3 downto 0);
	B	: in bit_vector(3 downto 0);
	S	: out bit_vector(7 downto 0)
);
end component;

	-- Sinais --

	signal A	: bit_vector(3 downto 0);
	signal Cs	: bit_vector(3 downto 0);
	signal Yss	: bit_vector(3 downto 0);

begin

	A(3 downto 0) <= "0000";

	REGY	: Registrador4Bits
	port map(A(3 downto 0), Y(3 downto 0), clk, clr, ldr, Yss(3 downto 0));

	REGC	: Registrador4Bits
	port map(A(3 downto 0), C(3 downto 0), clk, clr, ldc, Cs(3 downto 0));

	YxC(9 downto 8) <= "00";

	multiplicador 	: multi4Bits
	port map(Cs(3 downto 0), Yss(3 downto 0), YxC(7 downto 0));

	Ys(3 downto 0) <= Yss(3 downto 0);

end ckt;

entity BlocoOperacional is
port(	Y	: in bit_vector(3 downto 0);
	clock	: in bit;
	clr_r	: in bit;
	en_c	: in bit;
	ld_r	: in bit;
	ld_c	: in bit;
	s_cod	: in bit_vector(1 downto 0);
	ld_out	: in bit;
	F	: out bit_vector(9 downto 0)	
);
end BlocoOperacional;

architecture ckt of BlocoOperacional is
	-- Componenetes --
component blocoRxC is
port( 	Y	: in bit_vector(3 downto 0);
	C	: in bit_vector(3 downto 0);
	clk,clr	: in bit;
	ldc,ldr : in bit;
	Ys	: out bit_vector(3 downto 0);
	YxC	: out bit_vector(9 downto 0)
);
end component;

component Adder10Bits is
port(	A	: in bit_vector(9 downto 0);
	B	: in bit_vector(9 downto 0);
	Ci	: in bit;
	Co	: out bit;
	S	: out bit_vector(9 downto 0)
);
end component;

component Register10Bits is
port(	A	: in bit_vector(9 downto 0);
	I	: in bit_vector(9 downto 0);
	enable	: in bit;
	clock	: in bit;
	clr	: in bit;
	B	: out bit_vector(9 downto 0)
);
end component;

	-- Sinais --

	signal C0, C1, C2	: bit_vector(3 downto 0);
	signal Y0, Y1, Y2	: bit_vector(3 downto 0);
	signal Yxc0, Yxc1, Yxc2 : bit_vector(9 downto 0);
	signal co0, co1		: bit;
	signal Sum0, sum1	: bit_vector(9 downto 0);
	signal Af		: bit_vector(9 downto 0);

begin

	-- Nossas variaveis C0,1,2 --

	C0(3 downto 0) <= "0001";
	C1(3 downto 0) <= "0001";
	C2(3 downto 0) <= "0001";


	RxC0 : blocoRxC
	port map(Y(3 downto 0), C0(3 downto 0), clock, clr_r, ld_c, ld_r, Y0(3 downto 0), Yxc0(9 downto 0));

	RxC1 : blocoRxC
	port map(Y0(3 downto 0), C1(3 downto 0), clock, clr_r, ld_c, ld_r, Y1(3 downto 0), Yxc1(9 downto 0));

	RxC2 : blocoRxC
	port map(Y1(3 downto 0), C2(3 downto 0), clock, clr_r, ld_c, ld_r, Y2(3 downto 0), Yxc2(9 downto 0));

	somador0 : Adder10Bits
	port map(Yxc0(9 downto 0), Yxc1(9 downto 0), '0', co0, Sum0(9 downto 0));

	somador1 : Adder10Bits
	port map(Sum0(9 downto 0), Yxc2(9 downto 0), co0, co1, Sum1(9 downto 0));

	Af(9 downto 0) <= "0000000000";

	registradorFinal : Register10Bits
	port map(Af, Sum1(9 downto 0), ld_out, clock, '1', F(9 downto 0));


end ckt;
entity lab111 is
port(	A, S	: in bit_vector(7 downto 0);
	clk	: in bit;
	c	: in bit;
	d	: out bit
);
end lab111;

architecture ckt of lab111 is
	-- Componentes --
component Register8Bits is
port(	A	: in bit_vector(7 downto 0);
	clock	: in bit;
	clr	: in bit;
	B	: out bit_vector(7 downto 0)
);
end component;
component Adder8Bits is
port(	A	: in bit_vector(7 downto 0);
	B	: in bit_vector(7 downto 0);
	Ci	: in bit;
	Co	: out bit;
	S	: out bit_vector(7 downto 0)
);
end component;
component Mux2x1 is
port(	I0, I1	: in bit;
	s	: in bit;
	enable	: in bit;
	Y	: out bit
);
end component;

component comparator8Bits is
port(	A	: in bit_vector(7 downto 0);
	B	: in bit_vector(7 downto 0);
	Z	: out bit;
	X	: out bit;
	Y	: out bit
);
end component;
	-- Bloco combinacional --
component BlocoCombinacional is
port(	clk	: in bit;
	c	: in bit;
	lt_s	: in bit;
	d	: out bit;
	tot_ld	: out bit;
	tot_clr	: out bit
);
end component;

	signal AdderToMux	: bit_vector(7 downto 0);
	Signal MuxToReg		: bit_vector(7 downto 0);
	Signal RegToComp	: bit_vector(7 downto 0);
	signal RegToMux		: bit_vector(7 downto 0);
	signal RegToAdder	: bit_vector(7 downto 0);
	signal Cout		: bit;
	signal LD, CL, ME	: bit;
	signal clnot,aux1,aux2	: bit;
	signal aux3		: bit_vector(7 downto 0);

begin

	blocoComb : BlocoCombinacional
	port map(clk, c, ME, d, LD, CL);

	clnot <= not CL;

	somador	: Adder8Bits
	port map(A(7 downto 0), RegToAdder(7 downto 0), '0', Cout, AdderToMux(7 downto 0));

	aux3(7 downto 0) <= AdderToMux(7 downto 0);

	multiplexador0 : mux2x1
	port map(RegToMux(0), aux3(0), LD, '1', MuxToReg(0));

	multiplexador1 : mux2x1
	port map(RegToMux(1), aux3(1), LD, '1', MuxToReg(1));

	multiplexador2 : mux2x1
	port map(RegToMux(2), aux3(2), LD, '1', MuxToReg(2));

	multiplexador3 : mux2x1
	port map(RegToMux(3), aux3(3), LD, '1', MuxToReg(3));

	multiplexador4 : mux2x1
	port map(RegToMux(4), aux3(4), LD, '1', MuxToReg(4));

	multiplexador5 : mux2x1
	port map(RegToMux(5), aux3(5), LD, '1', MuxToReg(5));

	multiplexador6 : mux2x1
	port map(RegToMux(6), aux3(6), LD, '1', MuxToReg(6));

	multiplexador7 : mux2x1
	port map(RegToMux(7), aux3(7), LD, '1', MuxToReg(7));

	registrador : Register8Bits
	port map(MuxToReg(7 downto 0), clk, clnot, RegToComp(7 downto 0));

	RegToAdder(7 downto 0) <= RegToComp(7 downto 0);
	RegToMux(7 downto 0) <= RegToComp(7 downto 0);

	comporador  : comparator8Bits
	port map(S(7 downto 0), RegToComp(7 downto 0), aux1, ME, aux2);

	
end ckt;

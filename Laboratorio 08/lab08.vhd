entity lab08 is
port(	A, B	: in bit_vector(3 downto 0);
	en	: in bit;
	enp	: in bit;
	clk	: in bit;
	clr	: in bit;
	C	: out bit_vector(3 downto 0)
);
end lab08;

architecture  ckt of lab08 is
	-- Contador U/D --
component CounterUD is
port(	UD	: in bit;
	enable1	: in bit;
	enable2	: in bit;
	clock	: in bit;
	clear	: in bit;
	Entrada	: in bit_vector(3 downto 0);
	Saida	: out bit_vector(3 downto 0)
);
end component;
	--  Comparador  --
component Comparator4Bits is
port(	A, B	: in bit_vector(3 downto 0);
	Z	: out bit;
	X	: out bit;
	Y	: out bit
);
end component;

	-- Flip Flop JK --
component FFJK is
port(	clk, j, k, p, c : in bit;
	q		: out bit
);
end component;

	-- 	MUX 2x1		--
component Mux2x1 is
port(	I0, I1	: in bit;
	s	: in bit;
	enable	: in bit;
	Y	: out bit
);
end component;

	--	Signals		--

	signal FFToCounter	: bit;
	signal Z1,X1,Y1		: bit;
	signal Z2,X2,Y2		: bit;
	signal Z3,X3,Y3		: bit;
	signal aux1, aux2	: bit;
	signal sig0, sig1	: bit_vector(3 downto 0);
	signal aux3		: bit_vector(3 downto 0);

begin
	
	C(3 downto 0) <= aux3(3 downto 0);

	contador : CounterUD -- contador
	port map(FFToCounter, en, enp, clk, clr, sig0(3 downto 0), aux3(3 downto 0));

	comparador1 : Comparator4Bits -- Condicao para crescer 
	port map(sig0(3 downto 0), aux3(3 downto 0), Z1, X1, Y1);
	
	comparator2 : Comparator4Bits -- condicao para decrescer
	port map(sig1(3 downto 0), aux3(3 downto 0), Z2, X2, Y2);

	aux1 <= not Z1;
	aux2 <= not Z2;
	
	chinelinha : FFJK
	port map('0', '0', '0', aux2, aux1, FFToCounter);

	-- Saber ser A é maior ou menor que B --

	comparator3 : Comparator4Bits
	port map(A(3 downto 0), B(3 downto 0), Z3, X3, Y3);

	-- Para A

	mux0	: mux2x1
	port map(A(0), B(0), X3, '1', sig0(0));

	mux1	: mux2x1
	port map(A(1), B(1), X3, '1', sig0(1));

	mux2	: mux2x1
	port map(A(2), B(2), X3, '1', sig0(2));

	mux3	: mux2x1
	port map(A(3), B(3), X3, '1', sig0(3));

	-- Para B

	mux00	: mux2x1
	port map(B(0), A(0), X3, '1', sig1(0));

	mux10	: mux2x1
	port map(B(1), A(1), X3, '1', sig1(1));

	mux20	: mux2x1
	port map(B(2), A(2), X3, '1', sig1(2));

	mux30	: mux2x1
	port map(B(3), A(3), X3, '1', sig1(3));
	

end ckt;

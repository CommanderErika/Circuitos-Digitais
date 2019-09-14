entity lab06 is
port(	A	: in bit_vector(3 downto 0);
	K, clk	: in bit;
	enable	: in bit;
	Z	: out bit_vector(3 downto 0)
);
end lab06;

architecture ckt of lab06 is
component CircuitoYy is
port(	A 	: in bit_vector(3 downto 0);
	e 	: in bit;
	clock	: in bit;
	clear	: in bit;
	saida	: out bit

);
end component;
component CircuitoX is
port(	entrada	: in bit;
	clock	: in bit;
	clear	: in bit;
	Z	: out bit_vector(3 downto 0)
);
end component;

	signal conexao : bit;

begin
		
	Y	: CircuitoYy
	port map(A(3 downto 0), enable, clk, K, conexao);

	X	: CircuitoX
	port map(conexao, clk, K, Z(3 downto 0));


end ckt;
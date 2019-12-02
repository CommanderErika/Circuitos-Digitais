entity lab13 is
port(	Y	: in bit_vector(3 downto 0);
	clock	: in bit;
	F	: out bit_vector(9 downto 0)
);
end lab13;


architecture ckt of lab13 is

	-- Componentes --
component BlocoOperacional is
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
end component;

component BlocoCombinacional is
port(	clock	: in bit;
	clr_r	: out bit;
	en_c	: out bit;
	ld_r	: out bit;
	ld_c	: out bit;
	s_cod	: out bit_vector(1 downto 0);
	ld_out	: out bit	
);
end component;

	-- Sinais --

	signal clr, en_c, ld_r, ld_c, ld_out	: bit;
	signal s_cod				: bit_vector(1 downto 0);

begin


	blocoComb : BlocoCombinacional
	port map(clock, clr, en_c, ld_r, ld_c, s_cod(1 downto 0), ld_out);

	blocoOp	  : BlocoOperacional
	port map(Y(3 downto 0), clock, clr, en_c, ld_r, ld_c, s_cod(1 downto 0), ld_out, F(9 downto 0));

end ckt;

entity BlocoCombinacional is
port(	clock	: in bit;
	clr_r	: out bit;
	en_c	: out bit;
	ld_r	: out bit;
	ld_c	: out bit;
	s_cod	: out bit_vector(1 downto 0);
	ld_out	: out bit	
);
end BlocoCombinacional;


architecture ckt of BlocoCombinacional is
	-- Componentes --
component FFD is
port( clk, D, P, C: in bit;
	q: out bit
);
end component;

	-- Sinais --

	signal nexts	: bit_vector(2 downto 0);
	signal s	: bit_vector(2 downto 0);
	signal nclr_r	: bit;

begin

	nexts(0) <= ((not s(0)) and (not s(2))) or (s(2) and (not s(1)) and (not s(0)));
	nexts(1) <= ((not s(2)) and (not s(1)) and s(0)) or ((not s(2)) and s(1) and (not s(0)));
	nexts(2) <= ((not s(2)) and s(1) and s(0)) or (s(2) and (not s(1)) and (not s(0)));

	nclr_r	<= (not s(2)) and (not s(1)) and (not s(0));
	en_c 	<= s(2) or s(1);
	ld_r 	<= s(2) or s(1) or s(0);
	ld_c 	<= s(2) or s(1) or s(0);
	s_cod(0)<= ((not s(2)) and s(1) and s(0));
	s_cod(1)<= (s(2) and (not s(1)) and (not s(0)));
	ld_out	<= s(2) and (not s(1)) and s(0);
	
	clr_r <= not nclr_r;

	chinela0 : FFD
	port map(clock, nexts(0), '1', '1', s(0));

	chinela1 : FFD
	port map(clock, nexts(1), '1', '1', s(1));

	chinela2 : FFD
	port map(clock, nexts(2), '1', '1', s(2));

end ckt;

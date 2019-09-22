--- Contador U/D com entrada paralela ---
entity CounterUD is
port(	UD	: in bit;
	enable1	: in bit; -- funcionar o circuito
	enable2	: in bit; -- preset
	clock	: in bit;
	clear	: in bit;
	Entrada	: in bit_vector(3 downto 0);
	Saida	: out bit_vector(3 downto 0)
);
end CounterUD;

architecture ckt of CounterUD is
		--- Flip Flop JK ---
component FFJK is
port(	clk, j, k, p, c : in bit;
	q		: out bit
);
end component;

		--- Signals ---

	signal sig1	: bit_vector(3 downto 0); -- Preset
	signal sig2	: bit_vector(3 downto 0); -- logica do jk
	signal sig3	: bit_vector(3 downto 0); -- saidas dos ff jk
	signal aux1	: bit_vector(2 downto 0);
	signal aux2	: bit_vector(2 downto 0);

begin

	--- Entrada no preset ---

	sig1(0) <= not(enable2 and Entrada(0));
	sig1(1) <= not(enable2 and Entrada(1));
	sig1(2) <= not(enable2 and Entrada(2));
	sig1(3) <= not(enable2 and Entrada(3));

	--- Logica do Contador ---

	sig2(0) <= enable1;

	aux1(0)	<= (not UD) and sig3(0) and enable1;
	aux2(0) <= UD and (not sig3(0)) and enable1;
	sig2(1) <= UD xor sig3(0);

	aux1(1) <= aux1(0) and sig3(1) and enable1;
	aux2(1) <= aux2(0) and (not sig3(1)) and enable1;
	sig2(2) <= aux1(1) or aux2(1);

	aux1(2) <= aux1(1) and sig3(2) and enable1;
	aux2(2) <= aux2(1) and (not sig3(2)) and enable1;
	sig2(3) <= aux1(2) or aux2(2);

	--- Port map ---

	bit0 : FFJK
	port map(clock, sig2(0), sig2(0), sig1(0), clear, sig3(0));

	bit1 : FFJK
	port map(clock, sig2(1), sig2(1), sig1(1), clear, sig3(1));

	bit2 : FFJK
	port map(clock, sig2(2), sig2(2), sig1(2), clear, sig3(2));

	bit3 : FFJK
	port map(clock, sig2(3), sig2(3), sig1(3), clear, sig3(3));

	saida(3 downto 0) <= sig3(3 downto 0);


end ckt;

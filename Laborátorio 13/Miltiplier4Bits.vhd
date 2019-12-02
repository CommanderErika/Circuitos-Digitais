entity multi4Bits is
port(	A	: in bit_vector (3 downto 0);
	B	: in bit_vector(3 downto 0);
	S	: out bit_vector(7 downto 0)
);
end multi4Bits;


architecture ckt of multi4Bits is

	-- Componentes --
component Adder8Bits is
port(	A	: in bit_vector(7 downto 0);
	B	: in bit_vector(7 downto 0);
	Ci	: in bit;
	Co	: out bit;
	S	: out bit_vector(7 downto 0)
);
end component;

	-- Sinais --

	signal pp1	: bit_vector(7 downto 0);
	signal pp2	: bit_vector(7 downto 0);
	signal pp3	: bit_vector(7 downto 0);
	signal pp4	: bit_vector(7 downto 0);
	signal pp12	: bit_vector(7 downto 0);
	signal pp34	: bit_vector(7 downto 0);
	signal pptot	: bit_vector(7 downto 0);
	signal c1,c2,c3 : bit;

begin
	
	pp2(0) <= '0'; pp3(0) <= '0'; pp3(1) <= '0'; pp4(0) <= '0'; pp4(1) <= '0'; pp4(2) <= '0';
	pp1(7 downto 4) <= "0000";
	pp2(7 downto 5) <= "000";
	pp3(7 downto 6) <= "00";
	pp4(7) <= '0';
	pp1(0) <= A(0)and B(0); pp1(1) <= A(1)and B(0); pp1(2) <= A(2)and B(0); pp1(3) <= A(3)and B(0);
	pp2(1) <= A(0)and B(1); pp2(2) <= A(1)and B(1); pp2(3) <= A(2)and B(1); pp2(4) <= A(3)and B(1);
	pp3(2) <= A(0)and B(2); pp3(3) <= A(1)and B(2); pp3(4) <= A(2)and B(2); pp3(5) <= A(3)and B(2);
	pp4(3) <= A(0)and B(3); pp4(4) <= A(1)and B(3); pp4(5) <= A(2)and B(3); pp4(6) <= A(3)and B(3);

	somador12	: Adder8Bits
	port map(pp1(7 downto 0), pp2(7 downto 0), '0', c1, pp12(7 downto 0));
	
	somador34	: Adder8Bits
	port map(pp3(7 downto 0), pp4(7 downto 0), '0', c2, pp34(7 downto 0));

	somadortot	:Adder8Bits
	port map(pp12(7 downto 0), pp34(7 downto 0), '0', c3, pptot(7 downto 0));


	S(7 downto 0) <= pptot(7 downto 0);

end ckt;

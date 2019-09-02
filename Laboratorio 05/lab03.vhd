entity lab03 is
port(	SW	: in bit_vector(7 downto 0);
	HEX0	: out bit_vector(3 downto 0);
	HEX1	: out bit_vector(3 downto 0);
	HEX2	: out bit_vector(3 downto 0)
);
end lab03;

architecture ckt2 of lab03 is
component bloco is
port(	A	: in bit_vector(3 downto 0);
	S	: out bit_vector(3 downto 0)
);
end component;

	signal s0	: bit_vector(3 downto 0);
	signal s1	: bit_vector(3 downto 0);
	signal s2	: bit_vector(3 downto 0);
	signal s3	: bit_vector(3 downto 0);
	signal s4	: bit_vector(3 downto 0);
	signal s5	: bit_vector(3 downto 0);
	signal s6	: bit_vector(3 downto 0);
	signal bcd	: bit_vector(11 downto 0);

begin

	bloco0 : bloco
	port map( A(3)=>'0', A(2)=>SW(7), A(1)=>SW(6), A(0)=>SW(5), S(3 downto 0)=>s0(3 downto 0));

	bloco1 : bloco
	port map(A(3)=>s0(2), A(2)=>s0(1), A(1)=>s0(0), A(0)=>SW(4), S(3 downto 0)=>s1(3 downto 0));

	bloco2 : bloco
	port map(A(3)=>s1(2), A(2)=>s1(1), A(1)=>s1(0), A(0)=>SW(3), S(3 DOWNTO 0)=>s2(3 downto 0));

	bloco3 : bloco
	port map(A(3)=>s2(2), A(2)=>s2(1), A(1)=>s2(0), A(0)=>SW(2), S(3 downto 0)=>s3(3 downto 0));

	bloco4 : bloco
	port map(A(3)=>s3(2), A(2)=>s3(1), A(1)=>s3(0), A(0)=>SW(1), S(3 downto 0)=>s4(3 downto 0));

	bloco5 : bloco
	port map(A(3)=>'0', A(2)=>s0(3), A(1)=>s1(3), A(0)=>s2(3), S(3 downto 0)=>s5(3 downto 0));

	bloco6 : bloco
	port map(A(3)=>s5(2), A(2)=>s5(1), A(1)=>s5(0), A(0)=>s3(3), S(3 downto 0)=>s6(3 downto 0));

	bcd(11) <= '0';
	bcd(10) <= '0';
	bcd(0)  <= SW(0);
	bcd(9)	<= s5(3);
	bcd(8 downto 5) <= s6(3 downto 0);
	bcd(4 downto 1) <= s4(3 downto 0);

	HEX0(3 downto 0) <= bcd(3 downto 0);
	HEX1(3 downto 0) <= bcd(7 downto 4);
	HEX2(3 downto 0) <= bcd(11 downto 8);

end ckt2;
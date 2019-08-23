entity ckt1 is
port(	A, B, C , D	: in bit;
	S1, S2		: out bit
);
end ckt1;

architecture ckt of ckt1 is

	signal sig	: bit_vector(3 downto 0);

begin

	sig(0) <= A or B;
	sig(1) <= not(B xor C);
	sig(2) <= A and sig(1);
	sig(3) <= D or sig(1);

	S1 <= sig(0) xor sig(2);
	S2 <= sig(2) or sig(3);

end ckt;
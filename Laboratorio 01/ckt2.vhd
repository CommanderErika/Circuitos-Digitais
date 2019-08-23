entity ckt2 is
port(	A, B, C , D	: in bit;
	S1, S2		: out bit
);
end ckt2;

architecture cktt2 of ckt2 is

	signal sig	: bit_vector(3 downto 0);

begin

	sig(0) <= A xor B;
	sig(1) <= not(B xor C);
	sig(2) <= A and sig(1);
	sig(3) <= D xor sig(1);

	S1 <= sig(0) and sig(2);
	S2 <= sig(2) or sig(3);

end cktt2;
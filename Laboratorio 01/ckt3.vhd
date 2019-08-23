entity ckt3 is
port(	A, B, C , D	: in bit;
	S1, S2		: out bit
);
end ckt3;

architecture cktt3 of ckt3 is

	signal sig	: bit_vector(3 downto 0);

begin

	sig(0) <= D or C;
	sig(1) <= B and C;
	sig(2) <= D and sig(1);
	sig(3) <= A or sig(1);

	S1 <= (not(sig(0) xor sig(2)));
	S2 <= sig(2) or sig(3);

end cktt3;
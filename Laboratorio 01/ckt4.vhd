entity ckt4 is
port(	A, B, C , D	: in bit;
	S1, S2		: out bit
);
end ckt4;

architecture cktt4 of ckt4 is

	signal sig	: bit_vector(3 downto 0);

begin

	sig(0) <= D xor C;
	sig(1) <= B or C;
	sig(2) <= D or sig(1);
	sig(3) <= A xor sig(1);

	S1 <= not(sig(0) xor sig(2));
	S2 <= sig(2) or sig(3);

end cktt4;
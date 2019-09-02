entity FullAdder is
port(	A, B	: in bit;
	Cin	: in bit;
	Sum	: out bit;
	Cout	: out bit
);
end FullAdder;

architecture ckt of FullAdder is

	signal sig1, sig2	: bit;

begin

	sig1 <= Cin and (A xor B);
	sig2 <= A and B;

	Sum	<= A xor B xor Cin;
	Cout	<= sig2 or sig1;

end ckt;
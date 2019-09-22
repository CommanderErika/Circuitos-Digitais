entity Mux2x1 is
port(	I0, I1	: in bit;
	s	: in bit;
	enable	: in bit;
	Y	: out bit
);
end Mux2x1;

architecture ckt of Mux2x1 is

	signal sig1, sig2	: bit;

begin

	sig1 <= (not s) and I0;
	sig2 <= s and I1;
	
	Y <= enable and(sig1 or sig2);

end ckt;

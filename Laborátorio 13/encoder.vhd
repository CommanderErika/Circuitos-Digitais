entity encoder is
port(	enable, A, B	: in bit;
	Y3,Y2,Y1,Y0	: out bit
);
end encoder;

architecture ckt of encoder is

begin

	Y3 <= enable and A and B;
	Y2 <= enable and A and (not B);
	Y1 <= enable and (not A) and B;
	Y0 <= enable and (not A) and (not B);

end ckt;

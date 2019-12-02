entity Mux8x1 is
port(	I0, I1, I2, I3, I4, I5, I6, I7	: in bit;
	S0, S1, S2	:	in bit;
	enable		:	in bit;
	Y		:	out bit
);
end Mux8x1;

architecture cktMux8x1 of Mux8x1 is

	signal sig1	: bit_vector(7 downto 0);
	signal sig2	: bit;

begin

	--- Clear = I(0)  and Manter from I(5) to I(7) ---

	sig1(0)	<= (not S2) and (not S1) and (not S0) and I0;
	sig1(1)	<= (not S2) and (not S1) and S0 and I1;
	sig1(2)	<= (not S2) and S1 and (not S0) and I2;
	sig1(3)	<= (not S2) and S1 and S0 and I3;
	sig1(4)	<= S2 and (not S1) and (not S0) and I4;
	sig1(5)	<= S2 and (not S1) and S0 and I5;
	sig1(6)	<= S2 and S1 and (not S0) and I6;
	sig1(7)	<= S2 and S1 and S0 and I7;


	--- Output Y with Enable ---

	sig2	<= sig1(0) or sig1(1) or sig1(2) or sig1(3) or sig1(4) or sig1(5) or sig1(6) or sig1(7);

	Y	<= sig2 and enable;


end cktMux8x1;
ENTITY somador_completo_Wbits IS
GENERIC (W : NATURAL := 32);
PORT (a, b : IN  BIT_VECTOR(w - 1 DOWNTO 0); -- data inputs 
      cin  : IN  BIT; -- carry out
      s    : OUT BIT_VECTOR(w - 1 DOWNTO 0); -- data output
      cout : OUT BIT); -- carry out
END somador_completo_Wbits;
ARCHITECTURE structural OF somador_completo_Wbits IS 
	-- Signal declaration
	SIGNAL carry : 	BIT_VECTOR(W DOWNTO 0);
BEGIN
	carry(0) <= cin;
	f0 : FOR i IN (W-1) DOWNTO 0 GENERATE
		s(i) <= a(i) XOR b(i) XOR carry(i);
		carry(i + 1) <= (a(i) AND b(i)) OR (b(i) AND carry(i)) OR (a(i) AND carry(i));
	END GENERATE f0;
	cout <= carry(w);
END structural;

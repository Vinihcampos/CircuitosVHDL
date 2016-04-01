ENTITY meio_somador IS
PORT(	a,b : IN  BIT; -- data inputs
	s   : OUT BIT; -- data output
	cout: OUT BIT);-- carry out 
END meio_somador;
------------------------------------------
ARCHITECTURE structural OF meio_somador IS
BEGIN
	s <= a XOR b;
	cout <= a AND b; 
END structural;

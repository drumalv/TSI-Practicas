include "globals.mzn";

%Declaracion de variables
set of int: POS = 1..10;
set of int: VALUES = 0..9;
array[POS] of var VALUES: n;

%restricciones
constraint forall(i in POS)(n[i]==count(n,i-1));

solve satisfy;
output ["\(n[i])" | i in POS];
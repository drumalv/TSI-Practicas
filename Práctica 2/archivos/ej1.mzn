include "globals.mzn";

%Declaracion de variables
set of int: POS = 1..10;
set of int: VALUES = 0..9;
array[POS] of string: letras=["A","E","F","I","S","T","N","K","R","D"];
array[POS] of var VALUES: n;

%restricciones
constraint all_different(n);
constraint 3*n[2]+20*n[6]+200*n[5]+3000*n[2]+10000*n[6]+10000*n[3]+10000*n[10]+10*n[7]+100*n[4]
==n[2]+10*n[6]+100*n[3]+1000*n[1]+10000*n[9]+100000*n[8];

solve satisfy;
output ["\(letras[i]) = \(n[i]) \n" | i in POS];
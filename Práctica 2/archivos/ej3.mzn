include "globals.mzn";

%Declaracion de variables
set of int: POS = 1..6;
set of int: VALUES = 1..6;
array[POS] of var VALUES: n;

%restricciones
constraint all_different(n);
constraint n[1]!=1 /\ n[2]!=1; %restricciones horario profesor 1
constraint n[3]==2 \/ n[4]==2; %restricciones horario profesor 2
constraint n[1]!=3 /\ n[6]!=3; %restricciones horario profesor 3
constraint n[2]==4 \/ n[3]==4 \/ n[4]==4; %restricciones horario profesor 4
constraint n[3]==5 \/ n[4]==5; %restricciones horario profesor 5
%el profesor 6 puede a cualquier hora

solve satisfy;
output ["\(8+i):00-\(9+i):00 -> PROF-\(n[i]) \n" | i in POS];
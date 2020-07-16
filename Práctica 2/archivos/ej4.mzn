include "globals.mzn";
% 1. Definición de variables y constantes:
set of int: POS = 1..4;
array [POS,POS] of var 1..16: grupos;
array [POS,POS] of var 1..8: prof;
array [1..16] of string: clases = ["IA-G1","IA-G2","IA-G3","IA-G4","TSI-G1","TSI-G2","TSI-G3","TSI-G4","FBD-G1","FBD-G2","FBD-G3","FBD-G4","hueco","hueco","hueco","hueco"];

% 2. Definición de restricciones:

% Cada clase tiene 1 hora de duración a la semana.
constraint all_different([grupos[i, j] | i,j in POS]);

%Cada grupo recibe docencia de una única asignatura en cada momento
constraint forall(i,j in POS)(forall(k in POS where grupos[i,k]!=16 /\ grupos[i,k]!=15 /\ grupos[i,k]!=14 /\ grupos[i,k]!=13 /\ k!=j)(  (grupos[i,j] mod 4)!=(grupos[i,k] mod 4)  ) );

% Restricciones horarios
constraint grupos[2, 1]!=9 /\ grupos[2, 2]!=9 /\ grupos[2, 3]!=9 /\ grupos[2, 4]!=9;
constraint grupos[2, 1]!=10 /\ grupos[2, 2]!=10 /\ grupos[2, 3]!=10 /\ grupos[2, 4]!=10;
constraint grupos[1, 1]!=3 /\ grupos[1, 2]!=3 /\ grupos[1, 3]!=3 /\ grupos[1, 4]!=3;
constraint grupos[1, 1]!=4 /\ grupos[1, 2]!=4 /\ grupos[1, 3]!=4 /\ grupos[1, 4]!=4;

% Un profesor no puede estar en dos clases a la vez
constraint forall(j in POS)(alldifferent([prof[j, i] | i in POS]));

%cada profesor da docencia en los grupos definidos en la tabla
constraint forall(i,j in POS)(grupos[i, j]==1  \/ grupos[i,j]==2 \/ grupos[i,j]==5 \/ grupos[i,j]==6 -> prof[i,j] == 1);
constraint forall(i,j in POS)(grupos[i, j]==9  \/ grupos[i,j]==10 -> prof[i,j] == 2);
constraint forall(i,j in POS)(grupos[i, j]==7  \/ grupos[i,j]==8 \/ grupos[i,j]==11 \/ grupos[i,j]==12 -> prof[i,j] == 3);
constraint forall(i,j in POS)(grupos[i, j]==3  \/ grupos[i,j]==4 -> prof[i,j] == 4);

%si no hay nada no hay nada (los huecos)
constraint forall(i,j in POS)(prof[i, j]==5 <-> grupos[i,j] == 13);
constraint forall(i,j in POS)(prof[i, j]==6 <-> grupos[i,j] == 14);
constraint forall(i,j in POS)(prof[i, j]==7 <-> grupos[i,j] == 15);
constraint forall(i,j in POS)(prof[i, j]==8 <-> grupos[i,j] == 16);


% 3. Definición del problema. Para CSP usar:
solve satisfy;

% 4. Definición del output (opcional)
output ["A1-\(8+i):00-\(9+i):00 -> PROF-\(prof[i,1]) | \(grupos[i,1]) \n" | i in POS];
output ["\n"];
output ["A2-\(8+i):00-\(9+i):00 -> PROF-\(prof[i,2]) | \(grupos[i,2]) \n" | i in POS];
output ["\n"];
output ["A3-\(8+i):00-\(9+i):00 -> PROF-\(prof[i,3]) | \(grupos[i,3]) \n" | i in POS];
output ["\n"];
output ["A4-\(8+i):00-\(9+i):00 -> PROF-\(prof[i,4]) | \(grupos[i,4]) \n" | i in POS];
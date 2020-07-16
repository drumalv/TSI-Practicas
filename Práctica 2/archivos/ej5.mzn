include "globals.mzn";
% 1. Definición de variables y constantes:
set of int: HORAS = 1..6;
set of int: DIAS = 1..5;
array [HORAS,DIAS] of var 1..10: asig;
array [HORAS,DIAS] of var 1..5: prof;
array [1..3,DIAS] of var 0..9: bloques; %codAsigBloques={nada,"A1","A2","A3","A4","A5","A6","A7","A8","A9"} bloques de dos horas en el dia
%codAsig = ["A1","A2","A3","A4","A5","A6","A7","A8","A9","R"]; 5 es el prof del recreo

% 2. Definición de restricciones:

%la cuarta franja horaria es el recreo
constraint forall(i in DIAS)(asig[4,i]==10);
constraint forall(i in DIAS)(prof[4,i]==5);

% El número de horas semanales de cada asignatura 
constraint count([asig[i,j] | i in HORAS ,j in DIAS], 1)==4;
constraint count([asig[i,j] | i in HORAS ,j in DIAS], 2)==2;
constraint count([asig[i,j] | i in HORAS ,j in DIAS], 3)==4;
constraint count([asig[i,j] | i in HORAS ,j in DIAS], 4)==4;
constraint count([asig[i,j] | i in HORAS ,j in DIAS], 5)==4;
constraint count([asig[i,j] | i in HORAS ,j in DIAS], 6)==2;
constraint count([asig[i,j] | i in HORAS ,j in DIAS], 7)==2;
constraint count([asig[i,j] | i in HORAS ,j in DIAS], 8)==2;
constraint count([asig[i,j] | i in HORAS ,j in DIAS], 9)==1;

%en un dia no se ppuede dar dos veces la misma asignatura
constraint forall(j in DIAS ) (alldifferent_except_0([bloques[i,j]|i in 1..3]));
constraint forall(k in [2,6,7,9])(forall(j in DIAS)(count([asig[i,j] | i in HORAS ], k)<=1));

%restricciones sobre los bloques
constraint count([bloques[i,j] | i in 1..3 ,j in DIAS], 0)==6;
constraint forall(j in DIAS , i in 1..3) (bloques[i,j]!=2 /\ bloques[i,j]!=6 /\ bloques[i,j]!=7 /\ bloques[i,j]!=9);
constraint forall(j in DIAS)(bloques[1,j]!=0->bloques[2,j]==0);
constraint forall(j in DIAS)(bloques[2,j]!=0->bloques[1,j]==0);
%para que el profesor 1 y 2 no tengan dos bloques el mismo dia
constraint forall(i in 1..3 ,j in DIAS where bloques[i,j]==1)(forall(k in 1..3 where bloques[k,j]!=0 /\ k!=i)(  bloques[k,j]!=3  ) );
constraint forall(i in 1..3 ,j in DIAS where bloques[i,j]==5)(forall(k in 1..3 where bloques[k,j]!=0 /\ k!=i)(  bloques[k,j]!=4  ) );


%Las asignaturas {A1,A3,A4,A5,A8} deben impartirse en bloques de 2h
%consecutivas, mientras que el resto, es decir {A2,A6,A7,A9}, se imparten en
%bloques de 1h.
constraint forall(j in DIAS where bloques[1, j]!=0 ) (bloques[1,j]=asig[1, j] /\ bloques[1,j]=asig[2, j]);
constraint forall(j in DIAS where bloques[2, j]!=0 ) (bloques[2,j]=asig[2, j] /\ bloques[2,j]=asig[3, j]);
constraint forall(j in DIAS where bloques[3, j]!=0 ) (bloques[3,j]=asig[5, j] /\ bloques[3,j]=asig[6, j]);

%Profesores
constraint forall(i in HORAS ,j in DIAS where i!=4)(asig[i, j]==1  \/ asig[i,j]==3 -> prof[i,j] == 1);
constraint forall(i in HORAS ,j in DIAS where i!=4)(asig[i, j]==4  \/ asig[i,j]==5 -> prof[i,j] == 2);
constraint forall(i in HORAS ,j in DIAS where i!=4)(asig[i, j]==6  \/ asig[i,j]==9 -> prof[i,j] == 3);
constraint forall(i in HORAS ,j in DIAS where i!=4)(asig[i, j]==2 \/ asig[i,j]==7 \/ asig[i,j]==8 -> prof[i,j] == 4);


constraint forall(j in DIAS)(count([prof[i,j] | i in HORAS],3)<=1);

% 3. Definición del problema. Para CSP usar:
solve satisfy;

% 4. Definición del output (opcional) NO TERMINA  
%output ["LUNES-\(8+i):00-\(9+i):00 -> PROF-\(prof[i,1]) | \(asig[i,1]) \n" | i in HORAS];
%output ["\n"];
%output ["MARTES-\(8+i):00-\(9+i):00 -> PROF-\(prof[i,2]) | \(asig[i,2]) \n" | i in HORAS];
%output ["\n"];
%output ["MIERCOLES-\(8+i):00-\(9+i):00 -> PROF-\(prof[i,3]) | \(asig[i,3]) \n" | i in HORAS];
%output ["\n"];
%output ["JUEVES-\(8+i):00-\(9+i):00 -> PROF-\(prof[i,4]) | \(asig[i,4]) \n" | i in HORAS];
%output ["\n"];
%output ["VIERNES-\(8+i):00-\(9+i):00 -> PROF-\(prof[i,4]) | \(asig[i,4]) \n" | i in HORAS];









include "globals.mzn";
% 1. Definición de variables y constantes:
set of int: POS = 1..9;              %Los índices representan:
array [POS] of var int: diaInicio;   %[A, B, C, D, E, F, G, H, I]  <- los días de inicio de estas tareas
array [POS] of int: duracion=[7,3,1,8,2,1,1,3,2]; %duración de cada una de las tareas.
var int: duracionTotal;

% 2. Definición de restricciones:

%restricciones de la tabla
constraint diaInicio[1]==1;
constraint diaInicio[2]>=diaInicio[1]+duracion[1];
constraint diaInicio[3]>=diaInicio[2]+duracion[2];
constraint diaInicio[4]>=diaInicio[1]+duracion[1];
constraint (diaInicio[5]>=diaInicio[3]+duracion[3]) /\ (diaInicio[5]>=diaInicio[4]+duracion[4]);
constraint (diaInicio[6]>=diaInicio[3]+duracion[3]) /\ (diaInicio[6]>=diaInicio[4]+duracion[4]);
constraint (diaInicio[7]>=diaInicio[3]+duracion[3]) /\ (diaInicio[7]>=diaInicio[4]+duracion[4]);
constraint diaInicio[8]>=diaInicio[1]+duracion[1];
constraint (diaInicio[9]>=diaInicio[6]+duracion[6]) /\ (diaInicio[9]>=diaInicio[8]+duracion[8]);

%con esto consigo la duración total de construir la casa
constraint forall (i in POS)(duracionTotal>=diaInicio[i]+duracion[i]-1); 



% 3. Definición del problema. Para CSP usar:
solve minimize duracionTotal;
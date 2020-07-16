include "globals.mzn";
% 1. Definición de variables y constantes:
set of int: POS = 1..9;              %Los índices representan:
array [POS] of var int: diaInicio;   %[A, B, C, D, E, F, G, H, I]  <- los días de inicio de estas tareas
array [POS] of var int: duracion;
array [POS] of var 1..3: trabajadores;%que trabajador realiza la tarea x
var int: duracionTotal;
array [1..3,POS] of int: durTrabajadores=array2d(1..3,POS,[4,3,3,2,4,3,1,1,2,   7,5,1,5,2,2,2,3,3,   10,7,4,8,6,1,3,5,4,]); %lo que tarda cada trabajador en finalizar la tarea
array [1..15,POS] of var 0..3: calendario; %trabajador por día y tarea

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

%si el trabajador i hace la tarea j => la duración de la tarea debe ser la que tarde el trabajador i en hacerla.
constraint forall (i in 1..3 , j in POS where trabajadores[j]=i)(duracion[j]=durTrabajadores[i,j] );
%debe de estar colocado en el calendario el número de veces que indique duracion
constraint forall (j in POS)(count([calendario[i,j] | i in 1..15], trabajadores[j])==duracion[j]);
%la duración de una tarea debe ser la respectiva a algún trabajador
constraint forall (i in POS)(duracion[i]=durTrabajadores[1,i] \/ duracion[i]=durTrabajadores[2,i] \/ duracion[i]=durTrabajadores[3,i]);
%para que el trabajador esté en el calendario desde el dia de inicio hasta que acaba
constraint forall (k in 1..3 , j in POS where trabajadores[j]=k )( forall(i in 0..durTrabajadores[k,j]-1)(calendario[diaInicio[j]+i,j] = trabajadores[j]));
%no pueden hacer más de una tarea al día
constraint forall (i in 1..15)(count([calendario[i,j] | j in POS], 1)<=1);
constraint forall (i in 1..15)(count([calendario[i,j] | j in POS], 2)<=1);
constraint forall (i in 1..15)(count([calendario[i,j] | j in POS], 3)<=1);

%con esto consigo la duración total de construir la casa
constraint forall (i in POS)(duracionTotal>=diaInicio[i]+duracion[i]-1); 

% 3. Definición del problema. Para CSP usar:
solve minimize duracionTotal;
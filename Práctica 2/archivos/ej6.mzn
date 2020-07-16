include "globals.mzn";
% 1. Definición de variables y constantes:
set of int: POS = 1..5;              %Los índices representan:
array [POS] of var POS: colores;     %[roja, blanca, verde, amarilla, azul]
array [POS] of var POS: personas;    %[el vasco, el catalan, el gallego, el navarro, el andaluz]
array [POS] of var POS: animales;    %[perro, caracoles, zorro, caballo, cebra]
array [POS] of var POS: trabajos;    %[pintor, escultor, diplomático, violinista, medico]
array [POS] of var POS: bebidas;     %[té, cafe, leche, zumo, agua]

% 2. Definición de restricciones:
%nadie comparte gustos
constraint all_different(colores); 
constraint all_different(personas); 
constraint all_different(animales); 
constraint all_different(trabajos); 
constraint all_different(bebidas);

%restricciones

constraint forall(i in POS)(colores[i]==1 <-> personas[i]==1);
constraint forall(i in POS)(personas[i]==2 <-> animales[i]==1);
constraint forall(i in POS)(personas[i]==3 <-> trabajos[i]==1);
constraint forall(i in POS)(personas[i]==4 <-> bebidas[i]==1);
constraint personas[1]==5;
constraint forall(i in POS)(colores[i]==3 <-> bebidas[i]==2);
constraint forall(i in 1..4)(colores[i]==2 -> colores[i+1]==3);
constraint colores[5]!=2;
constraint forall(i in POS)(trabajos[i]==2 <-> animales[i]==2);
constraint forall(i in POS)(trabajos[i]==3 <-> colores[i]==4);
constraint bebidas[3]==3;
constraint colores[2]==5;
constraint forall(i in POS)(trabajos[i]==4 <-> bebidas[i]==4);
constraint forall(i in 2..4)(animales[i]==3 -> (trabajos[i-1]=5 \/ trabajos[i+1]=5));
constraint animales[1]==3 -> trabajos[2]=5;
constraint animales[5]==3 -> trabajos[4]=5;
constraint forall(i in 2..4)(animales[i]==4 -> (trabajos[i-1]=3 \/ trabajos[i+1]=3));
constraint animales[1]==4 -> trabajos[2]=3;
constraint animales[5]==4 -> trabajos[4]=3;
            
% 3. Definición del problema. Para CSP usar:
solve satisfy;

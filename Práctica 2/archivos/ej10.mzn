include "globals.mzn";
% 1. Definición de variables y constantes:

set of int: POS = 0..12; 
array [1..8] of var POS: mochila;   %cada entero es un objeto
var int: peso;
var int: pref;
array [POS] of int: pesos=array1d(POS,[0,9,13,153,50,15,68,27,39,23,52,11,32 ]);
array [POS] of int: preferencias=array1d(POS,[0,150,35,200,160,60,45,60,40,30,10,70,30]);
                                                                   
% 2. Definición de restricciones:
constraint alldifferent_except_0(mochila);
constraint sum(i in 1..8)(pesos[mochila[i]])=peso;
constraint sum(i in 1..8)(preferencias[mochila[i]])=pref;
constraint peso<=275;

% 3. Definición del problema. Para CSP usar:
solve maximize pref;
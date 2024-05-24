elemento(X,[X|R]). % Busca el elemento en una lista
elemento(X,[Y|R]):-elemento(X,R).
plantilla([1/S1,2/S2,3/S3,4/S4,5/S5,6/S6,7/S7,8/S8]). % plantillade columnas y renglones
solucion([]).% caso base la lista esta vacía
solucion([A/B|R]):-solucion(R),elemento(B,[1,2,3,4,5,6,7,8]),
no_ataca(A/B,R).
no_ataca(_,[]).
no_ataca(X/Y,[A/B|R]):-X=\=A,Y=\=B,
A-X=\=B-Y,
X-A=\=B-Y, % que los renglones y columnas sean diferentes para que no se coman
no_ataca(X/Y,R). % Busca que no se encuentren en la misma lista o renglón
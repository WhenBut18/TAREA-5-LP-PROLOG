/*
***
Estos predicados son para declarar y almacenar los "puentes" que unen los nodos (planetas)
del grafo, con el costo de combustible del traslado.
***
*/
puente(p1,c,4).
puente(p1,p4,1).
puente(p2,p3,7).
puente(p2,p1,3).
puente(p3,c,2).
puente(p4,c,3).
puente(p5,p1,7).
puente(p6,p2,2).
puente(p7,p2,3).
puente(p7,p6,4).
puente(p8,p3,8).
puente(p8,p9,3).
puente(p9,p10,10).
puente(p10,p4,6).
puente(p10,p3,3).
puente(p11,p12,3).
puente(p11,p4,7).
puente(p12,p5,2).

% Parte 1

/*
***
c : Caracter c del centro galactico.
ListaAux : Lista auxiliar con el recorrido del grafo.
Res : Lista final con el recorrido del grafo.
***
Este predicado se encarga de verificar que el caracter que se este leyendo
sea c, por ende llego al centro galactico, por lo que agrega c a la ListaAux
y con la funcion reverse la da vuelta y se la entrega a Res para que devuelva
el resultado final.
***
*/
caminoaux(c, ListaAux, Res):-
	reverse([c|ListaAux], Res).

/*
***
S : Planeta actual.
ListaAux : Lista auxiliar con el recorrido del grafo.
Res : Lista final con el recorrido del grafo.
***
Este predicado se encarga de obtener los planetas a los que se puede ir desde
S, y lo asigna a X, sin importar su uso de combustible, y se llama de forma
recursiva entregado el nuevo planeta X, agregando el planeta S en la ListaAux
y pasando la lista vacia Res.
***
*/
caminoaux(S, ListaAux, Res):-
	puente(S, X, _),
	caminoaux(X, [S|ListaAux], Res).

/*
***
S : Planeta inicial.
Res : Lista que contendra el recorrido de planetas.
***
Este predicado se encarga de llamar al predicado caminoaux para comenzar
el recorrido del grafo de planetas, entregando por parametros el planeta
S, una lista vacia, y Res.
***
*/	
camino(S, Res):-
	caminoaux(S, [], Res).


% Parte 2

/*
***
S : Caracter c del centro galactico.
V : Cantidad de combustible acutal.
ListaAux : Lista auxiliar con el recorrido del grafo.
RES : Lista final con el recorrido del grafo.
***
Este predicado se encarga de verificar que el caracter que se este leyendo
sea c, por ende llego al centro galactico, por lo que agrega c y V a una lista
y luego la agrega a ListaAux y con la funcion reverse la da vuelta y se la 
entrega a Res para que devuelva el resultado final.
***
*/
combustibleaux(c, V, ListaAux, RES):-
	L = [c,V],
	reverse([L|ListaAux], RES).

/*
***
S : Planeta inicial.
V : Cantidad de combustible inicial
ListaAux : Lista auxiliar con el recorrido del grafo.
RES : Lista final con el recorrido del grafo.
***
Este predicado se encarga de obtener los planetas a los que se puede ir desde
S y el combustible que consume el viaje, y se lo asigna a X e Y respectivamente,
luego se checkea que la cantidad de combustible sea suficiente, crea la sublista
que contiene el planeta y combustible, y finalmente se llama asi mismo de forma 
recursiva entregado el nuevo planeta X, la cantidad actual de combustible R, 
agregando la sublista L a la ListaAux y pasando la lista vacia RES.
***
*/
combustibleaux(S, V, ListaAux, RES):-
	puente(S, X, Y),
	R is V - Y,
	R >= 0,
	L = [S,V],	
	combustibleaux(X, R,[L|ListaAux], RES).

/*
***
S : Planeta inicial.
V : Cantidad de combustible inicial
RES : Lista final con el recorrido del grafo.
***
Este predicado se encarga de llamar al predicado combustibleaux para comenzar
el recorrido del grafo de planetas, entregando por parametros el planeta
S, la cantidad de combustible V, una lista vacia, y RES.
***
*/
combustible(S, V, RES):-
	combustibleaux(S, V, [], RES).
	
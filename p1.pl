/*
***
Lista : Lista con los caracteres de la palabra a revisar.
L : Posicion del caracter inicial.
R : Posicion del caracter final.
SubLista : SubLista de los caracteres entre las posiciones L y R.
***
Este predicado se encarga de extraer en SubLista la palabra contenida
entre L y R de Lista, utilizando las propiedades de la funcion
append para ir descomponiendo la Lista y obtener la SubLista deseada.
***
*/
extraersublista(Lista, L, R, SubLista) :-
	LPreLista is L-1,
	LSubLista is R - L + 1,
	length(PreLista, LPreLista),
	append(PreLista, PostLista, Lista),
	length(SubLista, LSubLista),
	append(SubLista, _, PostLista).

/*
***
Lista : Lista con los caracteres de la palabra a revisar.
[L, R] : Lista de 2 posiciones L y R.
***
Este predicado se encarga de llamar al predicado extraersublista
para obtener en SubLista la fraccion de la palabra contenida en Lista
a evaluar que sea palindroma, realizando esto con la funcion reverse,
que se al pasarle 2 parametro iguales devuelve true o false si es que
el reverso de la SubLista es igual a SubLista, osea es palindroma.
***
*/
esPalindroma(Lista, [L, R]) :-
	extraersublista(Lista, L, R, Sublista),
	reverse(Sublista, Sublista).
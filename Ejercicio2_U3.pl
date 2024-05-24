familia.pl
hombre(antonio).
hombre(juan).
hombre(luis).
hombre(rodrigo).
hombre(ricardo).
mujer(isabel).
mujer(ana).
mujer(marta).
mujer(carmen).
mujer(laura).
mujer(alicia).

matrimonio(antonio, ana).
matrimonio(juan, carmen).
matrimonio(luis, isabel).
matrimonio(rodrigo, laura).
% Hechos que describen relaciones de parentesco (hijos)
hijo(juan, antonio).
hijo(juan, ana).
hijo(rodrigo, antonio).
hijo(rodrigo, ana).
hijo(marta, antonio).
hijo(marta, ana).
hija(carmen, luis).
hija(carmen, isabel).
hijo(ricardo, juan).
hijo(ricardo, carmen).
hija(alicia, rodrigo).
hija(alicia, isabel).

% matrimonio es reflexivo
matrimonio_reflexivo(X, Y) :-matrimonio(X, Y). matrimonio(Y, X).

% nietos de una persona
nieto(Nieto, Abuelo) :-hijo(Nieto, Padre), hijo(Padre, Abuelo).

% abuelos de una persona
abuelo(Abuelo, Nieto) :-nieto(Nieto, Abuelo).

%hermanos de una persona
hermano(Hermano, Persona) :-hijo(Hermano, Padre), hijo(Persona, Padre),Hermano = Persona.

% tíos de una persona
tio(Tio, Sobrino) :-hermano(Tio, Padre),hijo(Sobrino, Padre).

% tías de una persona
tia(Tia, Sobrina) :-hermana(Tia, Padre),hijo(Sobrina, Padre).

% para hermana
hermana(Hermana, Persona) :-mujer(Hermana), hermano(Hermana, Persona).

% primos de una persona
primo(Primo1, Primo2) :-abuelo(X, Primo1), abuelo(X, Primo2), hermano(PadrePrimo1, X), hermano(PadrePrimo2, X), PadrePrimo1 = PadrePrimo2.

% primas de una persona
prima(Prima, Persona) :-hija(Persona, Padre), hermano(Tio, Padre), hijo(Prima, Tio), Prima = Persona.

% suegros de una persona
suegro(Suegro, Persona) :-matrimonio(Suegro, Hijo),
hijo(Persona, Hijo).
% Facts about gender
female(prakriti).
female(prapti).
female(darshana).
female(menuka).
male(ritesh).
male(krishna).

% Facts about parent-child relationships
parent(ritesh, prapti).
parent(ritesh, prakriti).
parent(menuka, prapti).
parent(menuka, prakriti).
parent(darshana, menuka).
parent(krishna, menuka).

% Rules
mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).
sister(X, Y) :- parent(X, Z), parent(Y, Z), female(X), female(Y), X \= Y.
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% Queries
list_females :-
    female(X),
    write(X), nl,
    fail.
list_females.

parent_of_prapti(X) :-
    parent(X, prapti),
    write(X), nl.

parents_of_menuka :-
    parent(X, menuka),
    write(X), nl.

father_of_prakriti(X) :-
    father(X, prakriti),
    write(X), nl.

mother_of_prapti(X) :-
    mother(X, prapti),
    write(X), nl.

children_of_krishna(X) :-
    father(krishna, X),
    write(X), nl.

grandparents_of_prapti(X) :-
    grandparent(X, prapti),
    write(X), nl.


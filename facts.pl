% Facts
likes(ritesh, apple).
girl(sitasma).
likes(brajesh, candy).
red(rose).
beautiful(rose).
owns(neharika, car).

% Rules and Queries

% Query: Who owns a car?
% Usage: ?- owns(X, car).
owns_a_car(X) :- owns(X, car).

% Query: What is red?
% Usage: ?- red(X).
what_is_red(X) :- red(X).

% Query: Who likes apples?
% Usage: ?- likes(X, apple).
who_likes_apples(X) :- likes(X, apple).

% Query: What does Brajesh like?
% Usage: ?- likes(brajesh, X).
what_does_brajesh_like(X) :- likes(brajesh, X).

% Query: Is Sitasma a girl?
% Usage: ?- girl(sitasma).
is_sitasma_a_girl :- girl(sitasma).

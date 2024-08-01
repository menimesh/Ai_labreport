% Facts
bigger(elephant, horse).
bigger(horse, donkey).
bigger(donkey, dog).
bigger(dog, monkey).
bigger(monkey, mouse).

% Rules
is_bigger(X, Y) :- bigger(X, Y).
is_bigger(X, Y) :- bigger(X, Z), is_bigger(Z, Y).


% Define capacities of the jugs
jug_capacity(a, 5).  % Jug A with capacity 5 liters
jug_capacity(b, 3).  % Jug B with capacity 3 liters

% Initial state
initial_state(state(0, 0)).

% Goal state
goal_state(state(4, _)).  % Goal is to measure exactly 4 liters

% Fill a jug completely
fill(Jug, state(_, B), state(Capacity, B)) :-
    jug_capacity(Jug, Capacity).

fill(Jug, state(A, _), state(A, Capacity)) :-
    jug_capacity(Jug, Capacity).

% Empty a jug
empty(Jug, state(A, B), state(0, B)) :-
    Jug = a.

empty(Jug, state(A, B), state(A, 0)) :-
    Jug = b.

% Pour water from one jug to another
pour(a, b, state(A, B), state(NewA, NewB)) :-
    jug_capacity(b, CapB),
    Transfer is min(A, CapB - B),
    NewA is A - Transfer,
    NewB is B + Transfer.

pour(b, a, state(A, B), state(NewA, NewB)) :-
    jug_capacity(a, CapA),
    Transfer is min(B, CapA - A),
    NewA is A + Transfer,
    NewB is B - Transfer.

% Define the valid moves
move(State, NextState) :-
    fill(a, State, NextState).
move(State, NextState) :-
    fill(b, State, NextState).
move(State, NextState) :-
    empty(a, State, NextState).
move(State, NextState) :-
    empty(b, State, NextState).
move(State, NextState) :-
    pour(a, b, State, NextState).
move(State, NextState) :-
    pour(b, a, State, NextState).

% Breadth-first search to find the solution
bfs([[State|Path]|_], Path) :-
    goal_state(State).
bfs([State|Rest], Path) :-
    findall([Next, State|Path],
            (move(State, Next), \+ member(Next, [State|Rest])),
            NewStates),
    append(Rest, NewStates, Queue),
    bfs(Queue, Path).

% Start solving the problem
solve :-
    initial_state(Initial),
    bfs([[Initial]], Path),
    write('Path to solution: '), nl,
    reverse(Path, Solution),
    maplist(write_state, Solution).

% Helper to print state
write_state(state(A, B)) :-
    format('Jug A: ~d liters, Jug B: ~d liters~n', [A, B]).

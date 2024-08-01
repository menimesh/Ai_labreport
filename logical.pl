% Facts
sunny(afternoon).
colder_than_yesterday.

% Rules
go_swimming :- sunny(afternoon).
take_canoe_trip :- \+ go_swimming.
home_by_sunset :- take_canoe_trip.

% Main rule to derive the conclusion based on given conditions
we_will_home_by_sunset :-
    \+ sunny(afternoon),
    colder_than_yesterday,
    ( \+ go_swimming -> take_canoe_trip ; true ),
    home_by_sunset.

% Query to find out if we will be home by sunset
check_if_home_by_sunset :-
    ( we_will_home_by_sunset ->
        write('We will be home by sunset.');
        write('We will NOT be home by sunset.')
    ).

% Facts
male(ram).
female(sita).
husband_of(ram, sita).
son_of(love, ram). 
son_of(kush, ram).
big_brother(love, kush).
small_brother(kush, love).

% Rules
% is there anyone male?
is_anyone_male(X) :- male(X).

% who is the husband of sita?
husband_of_sita(X) :- husband_of(X, sita).

% find the son of ram?
son_of_ram(X) :- son_of(X, ram).

% is kush big brother of ram?
is_kush_big_brother_of_ram :- big_brother(kush, ram).

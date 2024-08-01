% Facts
sent_email_message :- fail. % Change this to true if the email is sent
not_sent_email_message :- \+ sent_email_message.

% Rules
finish_writing_program :- sent_email_message.
go_to_sleep_early :- not_sent_email_message.
wake_up_early_feeling_refreshed :- go_to_sleep_early.

% Main rule to check if we will wake up feeling refreshed
wake_up_feeling_refreshed :-
    not(finish_writing_program),
    wake_up_early_feeling_refreshed.

% Test the conclusion
test_conclusion :-
    ( wake_up_feeling_refreshed ->
        write('The statement "wake up feeling refreshed" is valid.');
        write('The statement "wake up feeling refreshed" is not valid.')
    ).

% Initial State: monkey at door, box at window, monkey on floor, monkey doesn't have banana
initial(state(at_door, at_window, on_floor, no_banana)).

% Goal State: monkey has banana
goal(state(_, _, _, has_banana)).

% Move Action: walk from one position to another
move(state(Monkey, Box, on_floor, Banana), walk(Monkey, To), state(To, Box, on_floor, Banana)).

% Push Action: monkey pushes box from one position to another
move(state(Pos, Pos, on_floor, Banana), push(Pos, To), state(To, To, on_floor, Banana)).

% Climb Action: monkey climbs on box
move(state(Pos, Pos, on_floor, Banana), climb, state(Pos, Pos, on_box, Banana)).

% Grasp Action: monkey grabs banana
move(state(Pos, Pos, on_box, no_banana), grasp, state(Pos, Pos, on_box, has_banana)).

% Plan finder: from initial to goal
plan(State, _, []) :- goal(State).
plan(State, Visited, [Action | Rest]) :-
    move(State, Action, NewState),
    \+ member(NewState, Visited),
    plan(NewState, [NewState | Visited], Rest).

% Solve from the initial state
solve :-
    initial(State),
    plan(State, [State], Plan),
    write('Plan to get the banana:'), nl,
    print_plan(Plan).

print_plan([]).
print_plan([Step | Rest]) :-
    write('- '), write(Step), nl,
    print_plan(Rest).

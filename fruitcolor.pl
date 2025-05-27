% List of fruits
fruit(apple).
fruit(banana).
fruit(grape).
fruit(orange).

% List of colors
color(red).
color(yellow).
color(purple).
color(orange).

% Ensure all elements in a list are different
all_different([]).
all_different([H|T]) :-
    \+ member(H, T),
    all_different(T).

% Assign colors to fruits
assign_colors(FruitColors) :-
    FruitColors = [
        apple-AppleColor,
        banana-BananaColor,
        grape-GrapeColor,
        orange-OrangeColor
    ],
    color(AppleColor),
    color(BananaColor),
    color(GrapeColor),
    color(OrangeColor),
    all_different([AppleColor, BananaColor, GrapeColor, OrangeColor]).


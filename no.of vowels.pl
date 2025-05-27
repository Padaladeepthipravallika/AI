% Check if a character is a vowel
is_vowel(a).
is_vowel(e).
is_vowel(i).
is_vowel(o).
is_vowel(u).

% Base case: empty list has 0 vowels
count_vowels([], 0).

% If head is a vowel, increment count
count_vowels([H|T], Count) :-
    is_vowel(H),
    count_vowels(T, RestCount),
    Count is RestCount + 1.

% If head is not a vowel, do not increment
count_vowels([H|T], Count) :-
    \+ is_vowel(H),
    count_vowels(T, Count).

:- use_module(library(clpq)).

% Find the next number in range 1..16 that is not in the current list
nn(X) :- between(1, 16, X).
nn(X, L) :- nn(X), 
            \+ member(X, L).

puzzle() :-
    % 1:1
    nn(A1), 
    nn(A2, [A1]), 
    nn(A3, [A1, A2]), 
    nn(A4, [A1, A2, A3]),
    {A1 + A2 - A3 - A4 =:= 5},
    
    nn(B1, [A1, A2, A3, A4]), 
    nn(C1, [A1, A2, A3, A4, B1]), 
    nn(D1, [A1, A2, A3, A4, B1, C1]), 
    {A1 + B1 + C1 - D1 =:= 17},

    % 4:4
    nn(B4, [A1, A2, A3, A4, B1, C1, D1]),    
    nn(C4, [A1, A2, A3, A4, B1, B4, C1, D1]),    
    nn(D4, [A1, A2, A3, A4, B1, B4, C1, C4, D1]),
    {A4 + B4 + C4 + D4 =:= 48},
    
    nn(D2, [A1, A2, A3, A4, B1, B4, C1, C4, D1, D4]),     
    nn(D3, [A1, A2, A3, A4, B1, B4, C1, C4, D1, D2, D4]), 
    {D1 - D2 + D3 - D4 =:= 0},
    
    % 2:2
    nn(B2, [A1, A2, A3, A4, B1, B4, C1, C4, D1, D2, D3, D4]), 
    nn(B3, [A1, A2, A3, A4, B1, B2, B4, C1, C4, D1, D2, D3, D4]), 
    {B1 + B2 + B3 - B4 =:= 10},
    
    nn(C2, [A1, A2, A3, A4, B1, B2, B3, B4, C1, C4, D1, D2, D3, D4]), 
    {A2 + B2 - C2 - D2 =:= 8},
     
    % 3:3
    nn(C3, [A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C4, D1, D2, D3, D4]), 
    {C1 - C2 + C3 + C4 =:= 9},
    {A3 - B3 - C3 + D3 =:= 11},

    writef('X1=%w X2=%w X3=%w X4=%w X5=%w X6=%w X7=%w X8=%w X9=%w X10=%w X11=%w X12=%w X13=%w X14=%w X15=%w X16=%w', 
          [A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4, D1, D2, D3, D4]), nl, fail.


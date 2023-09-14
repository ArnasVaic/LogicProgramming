% Autorius: Arnas Vaicekauskas,
% Kursas: PS 3,
% Grupė: 3gr,
% Užduoties variantai: 1.5; 5.2

% Apibrėžkite predikatą realizuojantį nurodytą 
% sveikaskaitę operaciją nenaudodami daugybos (*, **) 
% ir dalybos (/, div, mod) Prolog operatorių. 
% Predikatuose, realizuojančiuose dalybą, 
% vadovaukitės Euklidinės dalybos apibrėžimu:

% dalybos sveikoji dalis (div). Pavyzdžiui:
% ?- div(7,-3,Div).
% Div = -2.

div(A, B, C) :-
    integer(A),
    integer(B),
    B =\= 0,
    divHelper(A, B, C).

divHelper(A, B, C) :-
    abs(A) < abs(B),
    C = 0.

divHelper(A, B, C) :-
    abs(A) >= abs(B),
    A1 is A - sign(A) * sign(B) * B,
    divHelper(A1, B, C1),
    C is C1 + sign(A) * sign(B).

% 
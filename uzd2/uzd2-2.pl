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

mul(A, 1, B) :- A == B.
mul(A, B, C) :-
    mul(A, Bm1, CmA),
    B is Bm1 + 1,
    C is CmA + A.
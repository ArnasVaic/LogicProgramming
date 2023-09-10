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


% divnat(a,b,c) ~ a // b == c 
% (implement without operator `//`)

% divnat(7,3,2) true
% divnat(4,3,1) true
% divnat(1,3,0) true

% divnat(-7,3,-2) true
% divnat(-4,3,-1) true
% divnat(-1,3,0) true

% divnat(7,-3,-2) true
% divnat(4,-3,-1) true
% divnat(1,-3,0) true

% divnat(-7,-3,-2) true
% divnat(-4,-3,-1) true
% divnat(-1,-3,0) true



% sgn(A) sgn(B) sng(C)
%   +      +
%   -      +
%   +      -
%   -      -

% a * b + q == c
% a + q/b == c
% q / b < 1 => q < b
% 3 * 6 = 18

divnat(A, B, C) :-
    C is 0,
    B > A.

% divnat(a,b,c) ~ a // b == c ~ a = c * b + q
divnat(A, B, C) :-
    Q is A - C * B,
    Q >= 0,
    Q < abs(B).
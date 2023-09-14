% Autorius: Arnas Vaicekauskas,
% Kursas: PS 3,
% Grupė: 3gr,
% Užduoties variantai: 1.5

% Duotas miestus jungiančių kelių tinklas. 
% Keliai vienakrypčiai, nesudarantys ciklų. 
% Kiekvienas kelias turi savo ilgį. 
% Ši informacija išreiškiama faktais 

% kelias(Miestas1, Miestas2, Atstumas). 

kelias(q0, q1, 1).
kelias(q0, q2, 1).
kelias(q0, q6, 1).
kelias(q0, q7, 1).
kelias(q0, q5, 1).
kelias(q0, q3, 1).

kelias(q1, q4, 1).
kelias(q2, q5, 1).
kelias(q2, q3, 1).
kelias(q3, q5, 1).

kelias(q4, q6, 1).
kelias(q5, q7, 1).

kelias(q6, q8, 1).
kelias(q7, q6, 1).
kelias(q7, q8, 1).

% Apibrėžkite predikatą 
% „galima nuvažiuoti iš miesto X į miestą Y“: 
% pravažiavus lygiai N tarpinių miestų.

nuo_iki_per_N(X, Y, 0) :- kelias(X, Y, _).
nuo_iki_per_N(X, Y, N) :- 
    kelias(X, T, _),
    nuo_iki_per_N(T, Y, M),
    N is M + 1. 

% nuo_iki_per_N(q0, q2, 0).
% nuo_iki_per_N(q0, q5, 1).
% nuo_iki_per_N(q0, q7, 2).
% nuo_iki_per_N(q0, q8, 3).
% nuo_iki_per_N(q0, q8, 4).
% nuo_iki_per_N(q0, q8, 5).

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

% div(10, 5, 2).
% div(-7, -3, 2).
% div(7, -3, Div).
% Autorius: Arnas Vaicekauskas,
% Kursas: PS 3,
% Grupė: 3gr,
% Užduoties variantai: 1.13; 2.2; 3.2; 4.3

% sulieti(S1,S2,R) - duoti išrūšiuoti didėjimo 
% tvarka sąrašai S1 ir S2. Sąrašas R gaunamas 
% suliejus šiuos du sąrašus taip, kad jo elementai 
% eitų didėjimo tvarka. Pavyzdžiui:

% ?- sulieti([1,4,11],[2,5,7],R).

% R = [1,2,4,5,7,11].

% sulieti([H1], [H2], R) :-
%     A is min(H1, H2),
%     B is max(H1, H2),
%     R = [A, B].

sulieti([X|Xs], [], R) :- R = [X|Xs].
sulieti([], [X|Xs], R) :- R = [X|Xs].
sulieti(L, [X|Xs], R) :- H1 >= X, sulieti(L, Xs, R1), R = [X|R1].
sulieti([X|Xs], L, R) :- H2 >  X, sulieti(Xs, L, R1), R = [X|R1].

% sulieti([], [1,2,3], R).
% sulieti([1],[2],[2,1]).

% apjungti(SS,R) - sąrašas R gaunamas iš duotojo sąrašų sąrašo SS, 
% sujungus pastarojo sąrašus į bendrą sąrašą. 
% Giliuosius sąrašus apdoroti nėra būtina. Pavyzdžiui:

% ?- apjungti([[a,b],[c],[d,[e,f], g]],R).

% R = [a,b,c,d,[e,f],g].

list_concat([], [X|Xs], [Y|Ys]) :- Y = X, Ys = Xs.
list_concat([X|Xs], L, [Y|Ys]) :- X = Y, list_concat(Xs, L, Ys).

apjungti([X], R) :- R = X.
apjungti([X|Xs], R) :- apjungti(Xs, R1), list_concat(X, R1, R).

% bendri(S1,S2,R) - sąrašas R susideda iš bendrų 
% duotųjų sąrašų S1 ir S2 elementų. Pavyzdžiui:

% ?- bendri([a,b,c,d],[d,b,e],R).
    
% R = [b,d].

yra(A, [A|_]).
yra(A, [X|Xs]) :- A \= X, yra(A, Xs).

bendri(A, A, A).
bendri([], [], []).
bendri([], [_|_], R) :- R = [].
bendri([X|Xs], L, R) :- not(yra(X, L)), bendri(Xs, L, R1), R = R1, !.
bendri([X|Xs], L, R) :- yra(X, L), bendri(Xs, L, R1), R = [X|R1], !.

% bendri([a,b,c,d],[d,b,e],R).
% bendri([3,2,1],[1,3,16,4],R).
% bendri(X,X,X).

% suma(S1,S2,Sum) - S1 ir S2 yra skaičiai vaizduojami skaitmenų sąrašais. 
% Sum - tų skaičių suma vaizduojama skaitmenų sąrašu. Pavyzdžiui:

% ?- suma([9,4,6,1,3,4],[2,8],Sum).
    
% Sum = [9,4,6,1,6,2].

reverse(A, B) :- reverse_worker(A, [], B).
reverse_worker([], R, R).
reverse_worker([X|Xs], A, R) :- reverse_worker(Xs, [X|A], R).

% apsukta suma be `vieno minty` perkėlimo

% pvz: [9,9,9,9,9,1] (zip_suma)
%      [1]
%      [10,9,9,9,9,1]
zip_suma([], [], []).
zip_suma([], [Y|YS], [Z|ZS]) :- Z is Y, zip_suma([], YS, ZS).
zip_suma([X|XS], [], [Z|ZS]) :- Z is X, zip_suma([], XS, ZS).
zip_suma([X|XS], [Y|YS], [Z|ZS]) :- Z is X + Y, zip_suma(XS, YS, ZS).


% propaguoja `vieną minty` pro visą skaičių atvirkščia tvarka.
% Carry parametras šiaip visada 0

% pvz: 
% apply_carry([10,9,9,9,9,1], X, 0).
% X = [0,0,0,0,0,2]

apply_carry([X], R, Carry) :- Y is X + Carry, Y < 10, R = [Y].

apply_carry([X], R, Carry) :- 
    Y is X + Carry, Y >= 10, 
    Z is Y mod 10, R = [Z, 1].

apply_carry([X|Xs], R, Carry) :- 
    Y is X + Carry, Y < 10,
    apply_carry(Xs, Rr, 0), 
    R = [Y|Rr].

apply_carry([X|Xs], R, Carry) :- 
    Y is X + Carry, Y >= 10, 
    apply_carry(Xs, Rr, 1),
    Z is Y mod 10, R = [Z|Rr].

suma(A, B, C) :-
    reverse(A, Ar), reverse(B, Br),
    zip_suma(Ar, Br, Z), apply_carry(Z, Cr, 0), !,
    reverse(Cr, C).

% suma([9,4,6,1,3,4],[2,8],Sum).
% suma([9,9,9,9],[1],Sum).
% suma([1,2,3],[7,7],Sum).
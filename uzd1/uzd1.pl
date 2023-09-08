% Autorius: Arnas Vaicekauskas, 
% Kursas: PS 3, 
% Grupė: 3gr,
% Užduoties variantai: 7; 24; 36; 37

% asmuo(Vardas, Lytis, Amžius, Pomėgis).
asmuo(pijus, vyras, 1, smuikas).
asmuo(vakare, moteris, 21, smuikas).
asmuo(marija, moteris, 15, gitara).
asmuo(arvydas, vyras, 12, mokslas).
asmuo(matas, vyras, 12, zaidimai).

asmuo(ona, moteris, 46, televizija).
asmuo(tomas, vyras, 50, slidinejimas).
asmuo(vytautas, vyras, 42, programavimas).
asmuo(sofija, moteris, 38, laipiojimas).

asmuo(algirdas, vyras, 65, automobiliai).
asmuo(valerija, moteris, 64, sokiai).

% mama(Mama, Vaikas).
mama(ona, arvydas).
mama(ona, vakare).
mama(ona, marija).
mama(ona, pijus).

mama(valerija, ona).
mama(valerija, vytautas).

mama(sofija, matas).

% pora(Vyras, Žmona).
pora(tomas, ona).
pora(vytautas, sofija).
pora(algirdas, valerija).

% seserys(Sesuo1, Sesuo2) - 
% Asmenys Sesuo1 ir Sesuo2 yra seserys
seserys(Sesuo1, Sesuo2) :-
    asmuo(Sesuo1, moteris, _, _),
    asmuo(Sesuo2, moteris, _, _),
    mama(Mama, Sesuo1),
    mama(Mama, Sesuo2),
    Sesuo1 \= Sesuo2.

tevas(Tevas, Vaikas) :-
    asmuo(Tevas, vyras, _, _),
    pora(Tevas, Mama),
    mama(Mama, Vaikas).

sergetojas(Sergetojas, Vaikas) :- mama(Sergetojas, Vaikas).
sergetojas(Sergetojas, Vaikas) :- tevas(Sergetojas, Vaikas).

tas_pats_asmuo(Asmuo1, Asmuo2) :-
    asmuo(Asmuo1, _, _, _),
    asmuo(Asmuo2, _, _, _),
    Asmuo1 == Asmuo2.

% pusbrolis(Pusbrolis, PusbrolisPussesere) - 
% Pirmasis asmuo (Pusbrolis) yra antrojo (PusbrolisPussesere) 
% pusbrolis (bet ne pusseserė!)
pusbrolis(Pusbrolis, PusbrolisPussesere) :-
    asmuo(Pusbrolis, vyras, _, _),
    asmuo(PusbrolisPussesere, _, _, _),
    mama(Mociute, Sergetojas1), sergetojas(Sergetojas1, Pusbrolis),
    mama(Mociute, Sergetojas2), sergetojas(Sergetojas2, PusbrolisPussesere),
    not(tas_pats_asmuo(Sergetojas1, Sergetojas2)).

% egzistuoja vyresniu
ne_vyriausias_vaikas(Vaikas) :-
    mama(Mama, Vaikas),
    mama(Mama, Kitas),
    asmuo(Vaikas, _, A, _),
    asmuo(Kitas, _, B, _),
    A < B.

% egzistuoja jaunesniu
ne_jauniausias_vaikas(Vaikas) :-
    mama(Mama, Vaikas),
    mama(Mama, Kitas),
    asmuo(Vaikas, _, A, _),
    asmuo(Kitas, _, B, _),
    A > B.
    
% vidurinis(Vaikas) - 
% Asmuo Vaikas yra ne vyriausias ir ne 
% jauniausias iš šeimoje esančių vaikų;
vidurinis(Vaikas) :-
    ne_vyriausias_vaikas(Vaikas),
    ne_jauniausias_vaikas(Vaikas).

% vunderkindas(Kudikis) - 
% Asmuo Kudikis „dar kūdikis, 
% o jau groja (mėgsta groti) smuiku“
% Note: pagal vikipedija kūdikiai yra nuo 1 iki 2 metų
vunderkindas(Kudikis) :-
    asmuo(Kudikis, _, Age, smuikas),
    Age >= 1, 
    Age =< 2.

% Užklausų pvz:
%
% seserys(marija,vakare)
% seserys(vakare, marija)
% seserys(matas, marija)
%
% pusbrolis(pijus,matas).
% pusbrolis(matas,pijus).
% pusbrolis(matas,arvydas).
% pusbrolis(matas,arvydas).
% pusbrolis(arvydas,matas).
% pusbrolis(matas,matas).
%
% vidurinis(marija).
% vidurinis(vakare).
% vidurinis(pijus).
% vidurinis(arvydas).
%
% vunderkindas(pijus)
% vunderkindas(vakare)
% vunderkindas(marija)
% vunderkindas(arvydas)
% vunderkindas(algirdas)
% vunderkindas(valerija)
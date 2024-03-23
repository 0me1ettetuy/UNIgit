%german
translation(german, table, tisch, m).
translation(german, chair, stuhl, m).
translation(german, bed, bett, n).
translation(german, child, kind, n).
translation(german, brother, bruder, m).
translation(german, sister, schwester, f).
translation(german, house, haus, n).
translation(german, sun, sonne, f).
translation(german, cloud, wolke, f).
translation(german, wind, wind, m).
translation(german, rain, regen, m).

article( f, die ).
article( m, der ).
article( n, das ).

%italian
translation(italian, table, tavolo, m).
translation(italian, chair, sedia, f).
translation(italian, bed, letto, m).
translation(italian, child, bambino, m).
translation(italian, child, bambina, f).
translation(italian, brother, fratello, m).
translation(italian, sister, sorella, f).
translation(italian, house, casa, f).
translation(italian, sun, sole, f).
translation(italian, cloud, nube, f).
translation(italian, wind, vento, m).
translation(italian, rain, pioggia, f).

%german rules
enggerm(E, G, A) :-
    translation(german, E, G, A).

enggerm(E, G, f) :-
    translation(german, E, G, n).

enggerm(E, G, m) :-
    translation(german, E, G, m).

enggerm(E, G, n) :-
    translation(german, E, G, f).

gerwitharticle( E, A, G ) :-
    translation(german, E, G, fmn),
    article(fmn, A).
    

%italian rules
engit(E, I, A) :-
    translation(italian, E, I, A).

engit(E, I, f) :-
    translation(italian, E, I, n).

engit(E, I, m) :-
    translation(italian, E, I, m).

engit(E, I, n) :-
    translation(italian, E, I, f).

gerit(G, I) :-
    translation(italian, _, I, _),
    translation(german, _, G, _).

gerit(G, I) :-
    translation(german, _, G, _),
    translation(italian, _, I, _).

samegender(E) :-
    enggerm(E, G, A),
    engit(E, I, A).



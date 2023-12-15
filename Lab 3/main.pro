implement main
    open core, stdio, file

domains
    тип = технический; кулинарный; научный; искусство; туристический; фитнес; литературный; здоровый; дизайнерский.

class facts - factsDb
    издание : (integer, string, string, real, тип) nondeterm.
    подписчик : (integer, string, integer, string) nondeterm.
    подписался : (integer, integer, string, integer, real) nondeterm.

class predicates
    кто_на_что_подписан : (string Имя, string Название [out]) nondeterm.
    стоимость_издания : (string Название, real Стоиомсть) nondeterm.

clauses
    кто_на_что_подписан(Имя, Название) :-
        подписчик(Имя_ID, Имя, _, _),
        подписался(Название_ID, Имя_ID, _, _, _),
        издание(Название_ID, Название, _, _, _).

    стоимость_издания(Название, Стоиомсть) :-
        издание(_, Название, _, Стоиомсть, _).

clauses
    run() :-
        consult('../facts.txt', factsDb),
        fail.

    run() :-
        write("Игорь подписан на :\n"),
        кто_на_что_подписан("Игорь", Название),
        write("\tИздание : ", Название),
        nl,
        fail.

    run().

end implement main

goal
    console::runUtf8(main::run).

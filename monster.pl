% Monster Type

%% basicType(type)

basicType(water).
basicType(grass).
basicType(fire).
basicType(ghost).
basicType(normal).

% Monsters

%% monster(monster, type)

monster(chewtle, water). % Chewtle
monster(pansage, grass). % Pansage
monster(rapidash, fire). % Rapidash
monster(shuppet, ghost). % Shuppet
monster(wooloo, normal). % Wooloo


/* Moves */

%% move(move, type)

% Water
move(waterGun, water).
move(hydroPump, water).

% Normal
move(headButt, normal).
move(tackle, normal).
move(quickAttack, normal).
move(screech, normal).
move(stomp, normal).

% Ghost
move(lick, ghost).
move(hex, ghost).
move(shadowBall, ghost).

% Fire
move(sunnyDay, fire).
move(flameCharge, fire).
move(overheat, fire).

% Grass
move(seedBomb, grass).
move(grassySlide, grass).


/* Monster moves */

%% monsterMove(monster, move)

% Chewtle
monsterMove(chewtle, waterGun).
monsterMove(chewtle, headButt).
monsterMove(chewtle, hydroPump).
monsterMove(chewtle, tackle).

% Pansage
monsterMove(pansage, lick).
monsterMove(pansage, sunnyDay).
monsterMove(pansage, seedBomb).
monsterMove(pansage, tackle).

% Rapidash
monsterMove(rapidash, flameCharge).
monsterMove(rapidash, sunnyDay).
monsterMove(rapidash, seedBomb).
monsterMove(rapidash, overheat).

% Shuppet
monsterMove(shuppet, hex).
monsterMove(shuppet, sunnyDay).
monsterMove(shuppet, shadowBall).
monsterMove(shuppet, screech).

% Wooloo
monsterMove(wooloo, grassySlide).
monsterMove(wooloo, tackle).
monsterMove(wooloo, headbutt).
monsterMove(wooloo, stomp).

/* Type Effectiveness */

%% typeEffectiveness(t1, t2, e)

% Fire
typeEffectiveness(fire, fire, weak).         % Fire Move vs Fire Monster = Weak
typeEffectiveness(fire, ghost, ordinary).    % Fire Move vs Ghost Monster = Ordinary
typeEffectiveness(fire, grass, strong).      % Fire Move vs Grass Monster = Strong
typeEffectiveness(fire, water, weak).        % Fire Move vs Water Monster = Weak
typeEffectiveness(fire, normal, ordinary).   % Fire Move vs Normal Monster = Ordinary

% Ghost
typeEffectiveness(ghost, fire, ordinary).    % Ghost Move vs Fire Monster = Ordinary
typeEffectiveness(ghost, ghost, strong).     % Ghost Move vs Ghost Monster = Strong
typeEffectiveness(ghost, grass, ordinary).   % Ghost Move vs Grass Monster = Ordinary
typeEffectiveness(ghost, water, ordinary).   % Ghost Move vs Water Monster = Ordinary
typeEffectiveness(ghost, normal, superweak). % Ghost Move vs Normal Monster = Super Weak

% Grass
typeEffectiveness(grass, fire, weak).        % Grass Move vs Fire Monster = Weak
typeEffectiveness(grass, ghost, ordinary).   % Grass Move vs Ghost Monster = Ordinary
typeEffectiveness(grass, grass, weak).       % Grass Move vs Grass Monster = Weak
typeEffectiveness(grass, water, strong).     % Grass Move vs Water Monster = Strong
typeEffectiveness(grass, normal, ordinary).  % Grass Move vs Normal Monster = Ordinary

% Water
typeEffectiveness(water, fire, strong).      % Water Move vs Fire Monster = Strong
typeEffectiveness(water, ghost, ordinary).   % Water Move vs Ghost Monster = Ordinary
typeEffectiveness(water, grass, weak).       % Water Move vs Grass Monster = Weak
typeEffectiveness(water, water, weak).       % Water Move vs Water Monster = Weak
typeEffectiveness(water, normal, ordinary).  % Water Move vs Normal Monster = Ordinary

% Normal
typeEffectiveness(normal, fire, ordinary).   % Normal Move vs Fire Monster = Ordinary
typeEffectiveness(normal, ghost, superweak). % Normal Move vs Ghost Monster = Super Weak
typeEffectiveness(normal, grass, ordinary).  % Normal Move vs Grass Monster = Ordinary
typeEffectiveness(normal, water, ordinary).  % Normal Move vs Water Monster = Ordinary
typeEffectiveness(normal, normal, ordinary). % Normal Move vs Normal Monster = Ordinary


/* Basic Effectiveness Relationships */

%% moreEffective(e1, e2)

moreEffective(strong, ordinary). % Strong > Ordinary
moreEffective(ordinary, weak).   % Ordinary > Weak
moreEffective(weak, superweak).  % Weak > Superweak

/* ------------------------------------------------------------- */

/***** Rules *****/

/* Transitive Effectiveness Rule */

% Base Case
moreEffectiveThan(E1, E2) :- moreEffective(E1, E2).

% Recursive Case
moreEffectiveThan(E1, E2) :- moreEffective(E1, E3), moreEffectiveThan(E3, E2).


/* Monster and Move Type Match Rule */
monsterMoveTypeMatch(MV, MO) :- monsterMove(MO, MV), move(MV, MT), monster(MO, MT).


/* Move MV1 is more effective than move MV2 against monsters of type T */

moreEffectiveTypeMove(T, MV1, MV2) :-
    move(MV1, T1),                 % Move MV1 is of type T
    move(MV2, T2),                 % Move MV2 is of type T
    typeEffectiveness(T1, T, E1),  % Move of Type T1 against monsters of type T has effectiveness E1
    typeEffectiveness(T2, T, E2),  % Move of Type T2 against monsters of type T has effectiveness E2
    moreEffectiveThan(E1, E2).     % E1 is more effective than E2


/* Move MV1 is more effective against MO2 than MV2 against MO1 */
moreEffectiveMonsterMove(MO1, MO2, MV1, MV2) :- 
    /* Checks if the Monster has the move specified
       else it doesn't continue with the sequence */
    monsterMove(MO1, MV1),!,          % Move MV1 is a move of monster MO1
    monsterMove(MO2, MV2),!,          % Move MV1 is a move of monster MO1

    move(MV1, MVT1),                  % Move MV1 is of type T1
    move(MV2, MVT2),                  % Move MV2 is of type T2

    monster(MO1, MT1),                % Monster MO1 is of type T1
    monster(MO2, MT2),                % Monster MO2 is of type T2

    typeEffectiveness(MVT1, MT2, E1), % Checks Effectiveness
    typeEffectiveness(MVT2, MT1, E2), % Checks Effectiveness

    moreEffectiveThan(E1, E2).        % Compares Effectiveness

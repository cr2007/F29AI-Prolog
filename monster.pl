% Monster Type
basicType(water).
basicType(grass).
basicType(fire).
basicType(ghost).
basicType(normal).

% Monsters
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
typeEffectiveness(fire, fire, weak).
typeEffectiveness(fire, ghost, ordinary).
typeEffectiveness(fire, grass, strong).
typeEffectiveness(fire, water, weak).
typeEffectiveness(fire, normal, ordinary).

% Ghost
typeEffectiveness(ghost, fire, ordinary).
typeEffectiveness(ghost, ghost, strong).
typeEffectiveness(ghost, grass, ordinary).
typeEffectiveness(ghost, water, ordinary).
typeEffectiveness(ghost, normal, superweak).

% Grass
typeEffectiveness(grass, fire, weak).
typeEffectiveness(grass, ghost, ordinary).
typeEffectiveness(grass, grass, weak).
typeEffectiveness(grass, water, strong).
typeEffectiveness(grass, normal, ordinary).

% Water
typeEffectiveness(water, fire, strong).
typeEffectiveness(water, ghost, ordinary).
typeEffectiveness(water, grass, weak).
typeEffectiveness(water, water, weak).
typeEffectiveness(water, normal, ordinary).

% Normal
typeEffectiveness(normal, fire, ordinary).
typeEffectiveness(normal, ghost, superweak).
typeEffectiveness(normal, grass, ordinary).
typeEffectiveness(normal, water, ordinary).
typeEffectiveness(normal, normal, ordinary).


/* Basic Effectiveness Relationships */

moreEffective(strong, ordinary).
moreEffective(ordinary, weak).
moreEffective(weak, superweak).

/* ------------------------------------------------------------- */

/* Rules */

/* Transitive Effectiveness */
moreEffectiveThan(E1, E2) :- moreEffective(E1, E2).


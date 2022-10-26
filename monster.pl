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
monster(shuppet, ghost).
monster(wooloo, normal).

%% Moves

%  Moves
move(waterGun, water).
move(hydroPump, water).
move(headButt, normal).

move(tackle, normal).

move(lick, ghost).
move(sunnyDay, fire).
move(seedBomb, grass).

move(flameCharge, fire).
move(quickAttack, normal).
move(overheat, fire).

move(hex, ghost).
move(shadowBall, ghost).
move(screech, normal).

move(grassySlide, grass).
move(stomp, normal).

%% Monster's moves

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

% typeEffectiveness(t1, t2, e)

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



/* ------------------------------------------------------------- */
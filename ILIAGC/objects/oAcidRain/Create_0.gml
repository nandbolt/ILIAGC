// Inherit the parent event
event_inherited();

// Rigid body
initRigidBody();

// HP
hp = 3;

// Gravity
gravityStrength = 0.05;

// Resistances
airConstant = 0.003;
groundConstant = 0.01;

// Damage
damage = 5;

// Sprite
fadeTime = 20;

// Rain spawn sound
audio_play_sound(sfxRainSpawn, 1, false);
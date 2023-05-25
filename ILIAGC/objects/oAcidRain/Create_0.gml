// Inherit the parent event
event_inherited();

// Rigid body
initRigidBody();

// HP
hp = 5;

// Gravity
gravityStrength = 0.05;

// Resistances
airConstant = 0.003;
groundConstant = 0.01;

// Damage
damage = 5;

// Sprite
fadeTime = 20;

// Sound
landSound = sfxRainLand;

// Theme
if (oWorld.currentTheme == Theme.NEOKYO_CITY) sprite_index = sNeokyoCityLaser;
else if (oWorld.currentTheme == Theme.NNE) sprite_index = sNNEBubble;

// Rain spawn sound
audio_play_sound(sfxRainSpawn, 1, false);
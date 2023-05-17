// Inherit the parent event
event_inherited();

// Rigid body
initRigidBody();

// HP
hp = 12;

// States
ignoreGraphs = true;

// Gravity
gravityStrength = 0;

// Resistances
airConstant = 0;
groundConstant = 0;
	
// Collisions
collisionType = Collision.BOUNCE;
	
// Sounds
landSound = sfxRainLand;

// Movement
xSpeed = 0.25;
maxBobSpeed = 0.5;
bobTimer = 0;
bobTimerSpeed = 0.05;

// Theme
if (oWorld.currentTheme == Theme.NNE) sprite_index = sNNEBigBubble;

// Bubble spawn sound
audio_play_sound(sfxRainSpawn, 1, false);

// Start in random direction
velocity.x = xSpeed;
if (irandom(1) == 0) velocity.x = -xSpeed;
// State
active = true;
collected = false;
collector = noone;

// Spin
spinCounter = 0;
spinSpeed = 0.05;

// Fade out
alphaFadeSpeed = 0.02;
driftUpSpeed = 0.1;
spinBoost = 0.1;
normalAlpha = 0.25;

// Sprite
imageXScale = 1;

// Sound
collectSound = sfxCoinCollect;

/// @func	onCollect();
onCollect = function(){}

/// @func	onActivate();
onActivate = function(){}

/// @func	activate();
activate = function()
{
	// Call on activate function
	onActivate();
	
	// Set active state
	active = true;
}

/// @func	collect();
collect = function()
{
	// Call on collect function
	onCollect();
	
	// Collect sound
	audio_play_sound(collectSound, 1, false);
	
	// Deactivate
	active = false;
	collected = true;
}
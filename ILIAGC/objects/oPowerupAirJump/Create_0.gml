// Inherit the parent event
event_inherited();

// Particles
particleColor = c_yellow;

// Jumps
maxJumps = oGame.myPowerups[Powerup.AIR_JUMP][1] * 10;
jumpsOnPickup = oGame.myPowerups[Powerup.AIR_JUMP][1] * 5;

/// @func	onCollect();
onCollect = function()
{
	// Set player jumps
	oPlayer.airJumps = clamp(oPlayer.airJumps + jumpsOnPickup, 0, maxJumps);
}
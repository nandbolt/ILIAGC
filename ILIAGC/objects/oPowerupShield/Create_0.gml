// Inherit the parent event
event_inherited();

// Particles
particleColor = c_aqua;

// Shields
maxShields = oGame.myPowerups[Powerup.SHIELD][1];

/// @func	onCollect();
onCollect = function()
{
	// Set player shield
	oPlayer.shield = clamp(oPlayer.shield + 1, 0, maxShields);
}
// Inherit the parent event
event_inherited();

// Particles
particleColor = c_fuchsia;

/// @func	onCollect();
onCollect = function()
{
	// Set invincibility
	with (oPlayer)
	{
		invinciblePowerActive = true;
		invincible = true;
		invinciblePowerTimer = oGame.myPowerups[Powerup.INVINCIBLE][1] * 15 * 60;
		if (oGame.myPowerups[Powerup.INVINCIBLE][1] > 2) deathTouch = true;
	}
}
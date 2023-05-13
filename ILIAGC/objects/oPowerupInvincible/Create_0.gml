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
		invinciblePowerTimer = 600;
	}
}
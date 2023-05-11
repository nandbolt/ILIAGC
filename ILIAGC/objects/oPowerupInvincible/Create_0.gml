// Inherit the parent event
event_inherited();

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
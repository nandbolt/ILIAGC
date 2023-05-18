// Inherit the parent event
event_inherited();

// Powerup
powerup = -1;

/// @func	onToggleOn();
onToggleOn = function()
{
	setPowerup(powerup);
}

/// @func	onToggleOff();
onToggleOff = function()
{
	unsetPowerup(powerup);
}
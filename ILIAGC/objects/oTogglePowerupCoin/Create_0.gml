// Inherit the parent event
event_inherited();

// Text
description = "Powerup";

// Powerup
powerup = Powerup.SHIELD;

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
// Inherit the parent event
event_inherited();

// Text
description = "Powerup";
price = 0;

// Powerup
powerup = Powerup.SHIELD;
level = 0;

/// @func	onCollect();
onCollect = function()
{
	// Set powerup
	setPowerup(powerup);
	
	// Unlock
	oGame.myPowerups[powerup][1]++;
}
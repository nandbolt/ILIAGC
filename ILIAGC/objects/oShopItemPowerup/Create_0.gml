// Inherit the parent event
event_inherited();

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
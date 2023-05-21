// Inherit the parent event
event_inherited();

// Powerup
powerup = Powerup.SHIELD;

// Saving
itemTypeString = "powerups";

/// @func	buyItem();
buyItem = function()
{
	// Set powerup
	setPowerup(powerup);
	
	// Unlock
	oGame.myPowerups[powerup][1]++;
	itemValue = oGame.myPowerups[powerup][1];
}
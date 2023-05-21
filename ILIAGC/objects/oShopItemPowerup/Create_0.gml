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
	
	// Save current powerup
	ini_open("save.ini");
	ini_write_real("inventory", getPowerupSaveName(powerup), 1);
	ini_close();
}
// Inherit the parent event
event_inherited();

// Saving
itemTypeString = "powerups";

/// @func	buyItem();
buyItem = function()
{
	// Set powerup
	setPowerup(itemIdx);
	
	// Unlock
	oGame.myPowerups[itemIdx][1]++;
	itemValue = oGame.myPowerups[itemIdx][1];
	
	// Save current powerup
	ini_open("save.ini");
	ini_write_real("inventory", getPowerupSaveName(itemIdx), 1);
	ini_close();
}
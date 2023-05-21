// Inherit the parent event
event_inherited();

// Powerup
powerup = -1;

/// @func	onToggleOn();
onToggleOn = function()
{
	setPowerup(powerup);
	
	// Save current powerup
	ini_open("save.ini");
	ini_write_real("inventory", getPowerupSaveName(powerup), 1);
	ini_close();
}

/// @func	onToggleOff();
onToggleOff = function()
{
	unsetPowerup(powerup);
	
	// Save current powerup
	ini_open("save.ini");
	ini_write_real("inventory", getPowerupSaveName(powerup), 0);
	ini_close();
}
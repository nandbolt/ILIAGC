// Inherit the parent event
event_inherited();

// Upgrade
upgrade = -1;

/// @func	onToggleOn();
onToggleOn = function()
{
	setUpgrade(upgrade);
	
	// Save current upgrade
	ini_open("save.ini");
	ini_write_real("inventory", getUpgradeSaveName(upgrade), 1);
	ini_close();
}

/// @func	onToggleOff();
onToggleOff = function()
{
	unsetUpgrade(upgrade);
	
	// Save current upgrade
	ini_open("save.ini");
	ini_write_real("inventory", getUpgradeSaveName(upgrade), 0);
	ini_close();
}
// Inherit the parent event
event_inherited();

// Misc
misc = -1;

/// @func	onToggleOn();
onToggleOn = function()
{
	setMisc(misc);
	
	// Save current theme
	ini_open("save.ini");
	ini_write_real("inventory", getMiscSaveName(misc), 1);
	ini_close();
}

/// @func	onToggleOff();
onToggleOff = function()
{
	unsetMisc(misc);
	
	// Save current theme
	ini_open("save.ini");
	ini_write_real("inventory", getMiscSaveName(misc), 0);
	ini_close();
}
// Inherit the parent event
event_inherited();

// Theme
theme = -1;

/// @func	onToggleOn();
onToggleOn = function()
{
	// Set theme
	setTheme(theme);
	
	// Toggle other coins off
	oToggleThemeCoin.toggledOn = false;
	
	// Set toggle on
	toggledOn = true;
	
	// Save current theme
	ini_open("save.ini");
	ini_write_real("inventory", "theme", theme);
	ini_close();
}

/// @func	onToggleOff();
onToggleOff = function()
{
	setTheme(Theme.DEFAULT);
	with (oToggleThemeCoin)
	{
		if (theme == Theme.DEFAULT) toggledOn = true;
	}
	
	// Save default theme
	ini_open("save.ini");
	ini_write_real("inventory", "theme", Theme.DEFAULT);
	ini_close();
}
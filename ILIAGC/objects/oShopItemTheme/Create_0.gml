// Inherit the parent event
event_inherited();

// Theme
theme = Theme.DEFAULT;

// Saving
itemTypeString = "themes";

/// @func	buyItem();
buyItem = function()
{
	setTheme(theme);
	oGame.myTheme[theme][1]++;
	itemValue = oGame.myTheme[theme][1];
	
	// Save current theme
	ini_open("save.ini");
	ini_write_real("inventory", "theme", theme);
	ini_close();
}
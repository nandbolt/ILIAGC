// Inherit the parent event
event_inherited();

// Saving
itemTypeString = "themes";

/// @func	buyItem();
buyItem = function()
{
	setTheme(itemIdx);
	oGame.myTheme[itemIdx][1]++;
	itemValue = oGame.myTheme[itemIdx][1];
	
	// Save current theme
	ini_open("save.ini");
	ini_write_real("inventory", "theme", itemIdx);
	ini_close();
}
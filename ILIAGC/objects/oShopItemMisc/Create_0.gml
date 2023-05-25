// Inherit the parent event
event_inherited();

// Saving
itemTypeString = "misc";

/// @func	buyItem();
buyItem = function()
{
	setMisc(itemIdx);
	oGame.myMisc[itemIdx][1]++;
	itemValue = oGame.myMisc[itemIdx][1];
	
	// Save current theme
	ini_open("save.ini");
	ini_write_real("inventory", getMiscSaveName(itemIdx), 1);
	ini_close();
}
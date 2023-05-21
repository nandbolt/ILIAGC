// Inherit the parent event
event_inherited();

// Theme
misc = Misc.DEBUG_MODE;

// Saving
itemTypeString = "misc";

/// @func	buyItem();
buyItem = function()
{
	setMisc(misc);
	oGame.myMisc[misc][1]++;
	itemValue = oGame.myMisc[misc][1];
}
// Inherit the parent event
event_inherited();

// Saving
itemTypeString = "modes";

/// @func	buyItem();
buyItem = function()
{
	oGame.myModes[itemIdx][1]++;
	itemValue = oGame.myModes[itemIdx][1];
}
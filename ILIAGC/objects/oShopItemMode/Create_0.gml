// Inherit the parent event
event_inherited();

// Mode
mode = Mode.COIN_RUSH;

// Saving
itemTypeString = "modes";

/// @func	buyItem();
buyItem = function()
{
	oGame.myModes[mode][1]++;
	itemValue = oGame.myModes[mode][1];
}
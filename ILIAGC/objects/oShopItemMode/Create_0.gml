// Inherit the parent event
event_inherited();

// Mode
mode = Mode.COIN_RUSH;

/// @func	onCollect();
onCollect = function()
{
	oGame.myModes[mode][1]++;
}
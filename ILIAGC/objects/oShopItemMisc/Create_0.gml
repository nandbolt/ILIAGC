// Inherit the parent event
event_inherited();

// Theme
misc = Misc.DEBUG_MODE;

/// @func	onCollect();
onCollect = function()
{
	setMisc(misc);
	oGame.myMisc[misc][1]++;
}
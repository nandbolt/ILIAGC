// Inherit the parent event
event_inherited();

// Text
description = "Green";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	oWorld.currentShader = shdrGreen;
	window_set_color(c_black);
	oGame.myTheme[Theme.GREEN][1]++;
}
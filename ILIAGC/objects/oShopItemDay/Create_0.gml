// Inherit the parent event
event_inherited();

// Text
description = "Day";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	oWorld.currentShader = shdrInvert;
	window_set_color(c_white);
	oGame.myTheme[Theme.DAY][1]++;
}
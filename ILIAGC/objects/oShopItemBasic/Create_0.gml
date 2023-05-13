// Inherit the parent event
event_inherited();

// Text
description = "Basic";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	oWorld.currentShader = shdrContrast;
	window_set_color(c_black);
	oGame.myTheme[Theme.BASIC][1]++;
}
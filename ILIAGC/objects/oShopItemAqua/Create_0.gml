// Inherit the parent event
event_inherited();

// Text
description = "Aqua";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	oWorld.currentShader = shdrAqua;
	window_set_color(c_black);
	oGame.myTheme[Theme.AQUA][1]++;
}
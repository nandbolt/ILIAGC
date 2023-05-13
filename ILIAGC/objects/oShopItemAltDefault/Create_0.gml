// Inherit the parent event
event_inherited();

// Text
description = "Alt Default";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	oWorld.currentShader = shdrAltDefault;
	window_set_color(c_black);
	oGame.myTheme[Theme.ALT_DEFAULT][1]++;
}
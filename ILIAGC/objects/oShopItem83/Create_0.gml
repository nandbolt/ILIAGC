// Inherit the parent event
event_inherited();

// Text
description = "83";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	oWorld.currentShader = shdr83;
	window_set_color(make_color_rgb(144,155,99));
	oGame.myTheme[Theme.TI_83][1]++;
}
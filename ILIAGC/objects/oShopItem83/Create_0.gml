// Inherit the parent event
event_inherited();

// Text
description = "83";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	setTheme(Theme.TI_83);
	oGame.myTheme[Theme.TI_83][1]++;
}
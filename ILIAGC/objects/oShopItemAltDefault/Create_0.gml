// Inherit the parent event
event_inherited();

// Text
description = "Alt Default";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	setTheme(Theme.ALT_DEFAULT);
	oGame.myTheme[Theme.ALT_DEFAULT][1]++;
}
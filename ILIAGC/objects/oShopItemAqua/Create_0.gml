// Inherit the parent event
event_inherited();

// Text
description = "Aqua";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	setTheme(Theme.AQUA);
	oGame.myTheme[Theme.AQUA][1]++;
}
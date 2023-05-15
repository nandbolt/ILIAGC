// Inherit the parent event
event_inherited();

// Text
description = "Basic";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	setTheme(Theme.BASIC);
	oGame.myTheme[Theme.BASIC][1]++;
}
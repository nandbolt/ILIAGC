// Inherit the parent event
event_inherited();

// Text
description = "Green";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	setTheme(Theme.GREEN);
	oGame.myTheme[Theme.GREEN][1]++;
}
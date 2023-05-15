// Inherit the parent event
event_inherited();

// Text
description = "Day";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	setTheme(Theme.DAY);
	oGame.myTheme[Theme.DAY][1]++;
}
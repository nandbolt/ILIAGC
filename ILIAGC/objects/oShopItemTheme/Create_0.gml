// Inherit the parent event
event_inherited();

// Theme
theme = Theme.DEFAULT;

/// @func	onCollect();
onCollect = function()
{
	setTheme(theme);
	oGame.myTheme[theme][1]++;
}
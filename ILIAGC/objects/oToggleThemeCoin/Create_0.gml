// Inherit the parent event
event_inherited();

// Text
description = "Default";

// Theme
theme = Theme.DEFAULT;

/// @func	onToggleOn();
onToggleOn = function()
{
	// Set theme
	setTheme(theme);
	
	// Toggle other coins off
	oToggleThemeCoin.toggledOn = false;
	
	// Set toggle on
	toggledOn = true;
}

/// @func	onToggleOff();
onToggleOff = function()
{
	setTheme(Theme.DEFAULT);
	with (oToggleThemeCoin)
	{
		if (theme == Theme.DEFAULT) toggledOn = true;
	}
}
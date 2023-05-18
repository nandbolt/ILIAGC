// Inherit the parent event
event_inherited();

// Theme
theme = -1;

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
// Inherit the parent event
event_inherited();

// Misc
misc = -1;

/// @func	onToggleOn();
onToggleOn = function()
{
	setMisc(misc);
}

/// @func	onToggleOff();
onToggleOff = function()
{
	unsetMisc(misc);
}
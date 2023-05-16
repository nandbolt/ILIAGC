// Inherit the parent event
event_inherited();

// Text
description = "Default";

// Misc
misc = Misc.DEBUG_MODE;

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
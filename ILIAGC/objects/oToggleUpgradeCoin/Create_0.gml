// Inherit the parent event
event_inherited();

// Text
description = "Upgrade";

// Upgrade
upgrade = Upgrade.EQUATION_UP;

/// @func	onToggleOn();
onToggleOn = function()
{
	setUpgrade(upgrade);
}

/// @func	onToggleOff();
onToggleOff = function()
{
	unsetUpgrade(upgrade);
}
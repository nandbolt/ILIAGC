// Inherit the parent event
event_inherited();

// Upgrade
upgrade = -1;

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
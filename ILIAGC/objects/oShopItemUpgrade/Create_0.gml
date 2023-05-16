// Inherit the parent event
event_inherited();

// Theme
upgrade = Upgrade.EQUATION_UP;

/// @func	onCollect();
onCollect = function()
{
	setUpgrade(upgrade);
	oGame.myUpgrades[upgrade][1]++;
}
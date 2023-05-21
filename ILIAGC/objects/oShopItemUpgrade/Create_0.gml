// Inherit the parent event
event_inherited();

// Theme
upgrade = Upgrade.EQUATION_UP;

// Saving
itemTypeString = "upgrades";

/// @func	buyItem();
buyItem = function()
{
	setUpgrade(upgrade);
	oGame.myUpgrades[upgrade][1]++;
	itemValue = oGame.myUpgrades[upgrade][1];
}
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
	
	// Save current upgrade
	ini_open("save.ini");
	ini_write_real("inventory", getUpgradeSaveName(upgrade), 1);
	ini_close();
}
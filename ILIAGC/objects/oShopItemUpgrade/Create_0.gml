// Inherit the parent event
event_inherited();

// Saving
itemTypeString = "upgrades";

/// @func	buyItem();
buyItem = function()
{
	setUpgrade(itemIdx);
	oGame.myUpgrades[itemIdx][1]++;
	itemValue = oGame.myUpgrades[itemIdx][1];
	
	// Save current upgrade
	ini_open("save.ini");
	ini_write_real("inventory", getUpgradeSaveName(itemIdx), 1);
	ini_close();
}
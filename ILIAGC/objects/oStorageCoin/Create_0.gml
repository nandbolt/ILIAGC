// Inherit the parent event
event_inherited();

// Text
description = "Storage";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Home coin
	instance_create_layer(96, 160, "Instances", oHomeCoin);
	
	// Display storage coins (Powerups, Stats)
	instance_create_layer(32, 128, "Instances", oStoragePowerupsCoin);
	instance_create_layer(64, 128, "Instances", oStorageThemesCoin);
	instance_create_layer(96, 128, "Instances", oStorageCharactersCoin);
	instance_create_layer(128, 128, "Instances", oStorageUpgradesCoin);
	instance_create_layer(160, 128, "Instances", oStorageMiscCoin);
}
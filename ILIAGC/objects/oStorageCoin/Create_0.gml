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
	instance_create_layer(96, 168, "Instances", oHomeCoin);
	
	// Display storage coins (Powerups, Stats)
	instance_create_layer(32, 136, "Instances", oStoragePowerupsCoin);
	instance_create_layer(64, 136, "Instances", oStorageThemesCoin);
	instance_create_layer(96, 136, "Instances", oStorageCharactersCoin);
	instance_create_layer(128, 136, "Instances", oStorageUpgradesCoin);
	instance_create_layer(160, 136, "Instances", oStorageMiscCoin);
}
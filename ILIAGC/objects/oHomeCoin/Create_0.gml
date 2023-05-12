// Inherit the parent event
event_inherited();

// Text
description = "Home";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Spawn home coins
	instance_create_layer(96, 96, "Instances", oModeCoin);
	instance_create_layer(160, 160, "Instances", oShopCoin);
	instance_create_layer(32, 160, "Instances", oStorageCoin);
}
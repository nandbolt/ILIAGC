// Inherit the parent event
event_inherited();

// Text
description = "Shop";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Main coins
	instance_create_layer(96, 168, "Instances", oHomeCoin);
	instance_create_layer(24, 168, "Instances", oDisplayCoinsInBank);
	instance_create_layer(120, 168, "Instances", oRerollCoin);
	
	// Spawn shop items
	shopSpawnItems();
}
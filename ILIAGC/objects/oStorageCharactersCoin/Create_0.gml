// Inherit the parent event
event_inherited();

// Text
description = "Characters";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Home coin
	instance_create_layer(96, 160, "Instances", oHomeCoin);
	
	// Display storage coins (Powerups, Stats)
}
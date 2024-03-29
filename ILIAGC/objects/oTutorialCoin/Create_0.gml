// Inherit the parent event
event_inherited();

// Text
description = "Tutorial";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Home coin
	instance_create_layer(160, 168, "Instances", oHomeCoin);
	
	// Spawn tutorial manager
	instance_create_layer(0,0,"Instances",oTutorial);
}
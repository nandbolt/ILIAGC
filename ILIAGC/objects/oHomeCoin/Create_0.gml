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
	with (oWorld)
	{
		spawnHomeCoins();
	}
}
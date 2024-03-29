// Inherit the parent event
event_inherited();

// Text
description = "Home";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Destroy tutorial if it exists
	if (instance_exists(oTutorial))
	{
		with (oTutorial)
		{
			endTutorial();
		}
	}
	
	// Spawn home coins
	with (oWorld)
	{
		spawnHomeCoins();
	}
}
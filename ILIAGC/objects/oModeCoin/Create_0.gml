// Inherit the parent event
event_inherited();

// Text
description = "Play Coin Rush";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Start game
	with (oWorld)
	{
		startGameCoinRush();
	}
}
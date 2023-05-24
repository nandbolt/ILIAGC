// Inherit the parent event
event_inherited();

// Description
description = "Coin Rush";
longDescription = getModeDescription(Mode.COIN_RUSH);

// Mode
mode = Mode.COIN_RUSH;

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Start game
	with (oWorld)
	{
		startGame(other.mode);
	}
}
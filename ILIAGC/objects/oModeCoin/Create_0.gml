// Inherit the parent event
event_inherited();

/// @func	onCollect();
onCollect = function()
{
	// Start game
	with (oWorld)
	{
		startGameCoinRush();
	}
}
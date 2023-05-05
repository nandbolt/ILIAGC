// Inherit the parent event
event_inherited();

/// @func	onCollect();
onCollect = function()
{
	// Change to world scope
	with (oWorld)
	{
		// Update time
		gameTimer += 10;
	}
}
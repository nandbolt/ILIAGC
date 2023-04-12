// Inherit the parent event
event_inherited();

/// @func	onCollect();
onCollect = function()
{
	// Change to world scope
	with (oWorld)
	{
		// Start timers
		gameTimer = 59;
		gameCounter = 0;
		
		// Reset coins
		coins = 0;
		
		// Start game
		gameStarted = true;
	}
	
	// Spawn first coin
	instance_create_layer(random_range(24,168),random_range(24,168),"Instances",oCoin);
}
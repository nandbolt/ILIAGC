// If game started
if (gameStarted)
{
	// Increment counter
	gameCounter++;
	
	// If a second has passed
	if (gameCounter >= 60)
	{
		// Update timers
		gameTimer--;
		gameCounter = 0;
		
		// If timer reached zero
		if (gameTimer <= 0)
		{
			// Destroy all collectables
			instance_destroy(oCollectable);
			
			// End game
			gameStarted = false;
			
			// Spawn mode coin
			instance_create_layer(96,96,"Instances",oModeCoin);
		}
	}
}
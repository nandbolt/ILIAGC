// If game started and timer not paused
if (gameStarted && !gameTimerPaused)
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
			
			// Highscore
			if (coins > mostCoins)
			{
				// Save new high score to disk
				mostCoins = coins;
				ini_open("save.ini");
				ini_write_real("high_scores","most_coins",mostCoins);
				ini_close();
			}
		}
	}
}
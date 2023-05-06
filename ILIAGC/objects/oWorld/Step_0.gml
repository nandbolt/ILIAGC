// If game started and timer not paused
if (gameStarted && !gameTimerPaused)
{
	// Increment counters
	gameCounter++;
	obstacleTimer--;
	
	// Clock timer
	if (clockTimer <= 0)
	{
		instance_create_layer(random_range(24,168), random_range(24,168), "BackgroundInstances", oClock);
		clockTimer = 600;
	}
	else if (!instance_exists(oClock)) clockTimer--;
	
	// If obstacle timer complete
	if (obstacleTimer <= 0)
	{
		// Create obstacle
		var _i = irandom_range(0, array_length(obstacles) - 1);
		var _obstacle = obstacles[_i];
		var _x = random_range(24,168), _y = random_range(24,168);
		if (_obstacle == oCloud) _y = 24;
		instance_create_layer(_x, _y, "BackgroundInstances", _obstacle);
		obstacleTimer = irandom_range(minObstacleTime, maxObstacleTime);
	}
	
	// If a second has passed
	if (gameCounter >= 60)
	{
		// Update timers
		gameTimer--;
		gameCounter = 0;
		timeElapsed++;
		
		// Decrement graph cooldowns
		with (oGrapher)
		{
			for (var _i = 0; _i < array_length(graphs); _i++)
			{
				if (graphs[_i][2] > 0) graphs[_i][2]--;
			}
		}
		
		// Difficulty scaling
		if (timeElapsed mod 20 == 0)
		{
			minObstacleTime = clamp(minObstacleTime - 20, lowestMinObstacleTime, baseMinObstacleTime);
			maxObstacleTime = clamp(maxObstacleTime - 20, lowestMaxObstacleTime, baseMaxObstacleTime);
		}
		
		// If obstacles exist
		if (instance_exists(oObstacle))
		{
			// Decrement health
			with (oObstacle)
			{
				hp--;
				if (hp <= 0) instance_destroy();
			}
		}
		
		// If timer reached zero
		if (gameTimer <= 0)
		{
			// Destroy all game objects
			instance_destroy(oCollectable);
			instance_destroy(oObstacle);
			
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
			
			// Zero graph cooldowns
			with (oGrapher)
			{
				for (var _i = 0; _i < array_length(graphs); _i++)
				{
					graphs[_i][2] = 0;
				}
			}
		}
	}
}
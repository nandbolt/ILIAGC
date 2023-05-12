// If game started and timer not paused
if (gameStarted && !gameTimerPaused)
{
	// Increment counters
	gameCounter++;
	obstacleTimer--;
	
	// Powerup timer
	if (powerupTimer <= 0)
	{
		var _powerupObject = powerups[irandom(array_length(powerups) - 1)];
		instance_create_layer(random_range(24,168), random_range(24,168), "BackgroundInstances", _powerupObject);
		powerupTimer = irandom_range(minStepsBetweenPowerups, maxStepsBetweenPowerups);
	}
	else powerupTimer--;
	
	// If obstacle timer complete
	if (obstacleTimer <= 0)
	{
		// Get obstacle count
		var _obstacleCount = 1;
		var _num = random(100);
		if (_num < 10) _obstacleCount = 3;
		else if (_num < 40) _obstacleCount = 2;
		repeat (_obstacleCount)
		{
			// Create obstacle
			var _i = irandom_range(0, array_length(obstacles) - 1);
			var _obstacle = obstacles[_i];
			var _x = random_range(24,168), _y = random_range(24,168);
			if (_obstacle == oCloud) _y = random_range(24,84);
			instance_create_layer(_x, _y, "Instances", _obstacle);
			obstacleTimer = irandom_range(minObstacleTime, maxObstacleTime);
		}
	}
	
	// If a second has passed
	if (gameCounter >= 60)
	{
		// Update timers
		gameTimer--;
		gameCounter = 0;
		timeElapsed++;
		
		// Difficulty scaling
		if (timeElapsed mod 20 == 0)
		{
			minObstacleTime = clamp(minObstacleTime - 20, lowestMinObstacleTime, baseMinObstacleTime);
			maxObstacleTime = clamp(maxObstacleTime - 20, lowestMaxObstacleTime, baseMaxObstacleTime);
		}
		
		// Clock aid
		if (timeElapsed mod timeBetweenNormalClocks == 0) instance_create_layer(random_range(24,168), random_range(24,168), "BackgroundInstances", oClock);
		if (timeElapsed mod timeBetweenBonusClocks == 0) instance_create_layer(random_range(24,168), random_range(24,168), "BackgroundInstances", oClock);
		
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
		
		// End game if timer reached zero
		if (gameTimer <= 0) endGameCoinRush();
	}
}
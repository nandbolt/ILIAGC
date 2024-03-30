#region Players

// If game is not paused
if (!oGame.gamePaused)
{
	// Get info
	var _numPlayersSpawned = instance_number(oPlayer);
	var _numPlayersConnected = ds_list_size(oInput.playerGamepadIds);

	// If someone connected
	if (_numPlayersSpawned < _numPlayersConnected)
	{
		// Add all necessary players
		for (var _playerId = 0; _playerId < ds_list_size(oInput.playerGamepadIds); _playerId++)
		{
			// Spawn player
			spawnPlayer(_playerId);
		}
	}
	// Else if someone disconnected
	else if (_numPlayersSpawned > _numPlayersConnected)
	{
		// Remove unnecessary players
		for (var _playerId = _numPlayersSpawned - 1; _playerId >= _numPlayersConnected; _playerId--)
		{
			// Despawn player
			despawnPlayer(_playerId);
		}
	}
}

#endregion

// If game started and timer not paused
if (gameStarted && !gameTimerPaused)
{
	// Increment counters
	gameCounter++;
	if (array_length(obstaclesToSpawn) == 0) obstacleTimer--;
	
	// Combo timer
	if (comboTimer > 0) comboTimer--;
	else comboMeter = 0;
	
	// Powerup timer
	if (powerupTimer <= 0)
	{
		// If powerup pool not empty
		if (array_length(powerups) > 0)
		{
			// Get powerup count
			var _powerupCount = 1;
			if (random(1) * powerupDiversity > 0.5) _powerupCount++;
			
			// Add powerups
			repeat (_powerupCount)
			{
				var _powerupObject = powerups[irandom(array_length(powerups) - 1)];
				instance_create_layer(random_range(24,168), random_range(24,168), "Instances", _powerupObject);
			}
		}
		
		// Update powerup timer
		updatePowerupTimer();
	}
	else powerupTimer--;
	
	// If obstacle timer complete
	if (obstacleTimer <= 0)
	{
		// Get obstacle count
		var _obstacleCount = 1;
		var _obstacleCountFactor = minObstacleSpawnCountFactor + (maxObstacleSpawnCountFactor - minObstacleSpawnCountFactor) * difficultyFactor;
		for (var _i = 0; _i < maxObstacleSpawnCount; _i++)
		{
			if (random(1) > _obstacleCountFactor) break;
			_obstacleCount++;
		}
		
		// Add obstacles
		var _isEvent = false;
		if (random(1) < 0.04) _isEvent = true;
		var _lowerBoundIdx = 0;
		if (gameMode == Mode.PUZZLE) _lowerBoundIdx = 1; // Don't add any more graph eaters
		var _i = irandom_range(_lowerBoundIdx, array_length(obstacles) - 1);
		repeat (_obstacleCount)
		{
			// Add obstacle
			array_push(obstaclesToSpawn, obstacles[_i]);
			
			// Reshuffle index if not event
			if (!_isEvent) _i = irandom_range(0, array_length(obstacles) - 1);
		}
		
		// Set obstacle timer
		updateObstacleTimer();
	}
	
	// If a second has passed
	if (gameCounter >= 60)
	{
		// Update timers
		gameTimer--;
		gameCounter = 0;
		timeElapsed++;
		
		// Difficulty scaling
		difficultyFactor = clamp(timeElapsed / maxDifficultyTime, 0, 1);
		
		// Clock aid
		if (timeElapsed mod timeBetweenBonusClocks == 0) instance_create_layer(random_range(24,168), random_range(24,168), "BackgroundInstances", oResetClock);
		else if (timeElapsed mod timeBetweenNormalClocks == 0) instance_create_layer(random_range(24,168), random_range(24,168), "BackgroundInstances", oClock);
		
		// If obstacles exist
		if (instance_exists(oObstacle))
		{
			// Decrement health
			with (oObstacle)
			{
				hp--;
				if (hp <= 0) active = false;
			}
		}
		
		// Spawn obstacles if there are any to spawn
		if (array_length(obstaclesToSpawn) > 0 && instance_number(oObstacle) < maxObstacleCount)
		{
			// Choose obstacle
			var _obstacle = array_pop(obstaclesToSpawn);
			var _x = random_range(spawnMinX, spawnMaxX), _y = spawnMaxY;
			var _layer = "Instances";
			if (_obstacle == oCloud) _y = random_range(spawnMinY, cloudSpawnMaxY);
			else
			{
				_y = random_range(spawnMinY, spawnMaxY);
				if (_obstacle == oSpikes || _obstacle == oGraphEater) _layer = "BackgroundInstances";
			}
			
			// Spawn obstacle
			instance_create_layer(_x, _y, _layer, _obstacle);
		}
		
		// End game if timer reached zero
		if (gameTimer <= 0) endGame();
	}
}
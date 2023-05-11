// States
gameStarted = false;

// Timer
gameTimer = 0;
gameCounter = 0;
gameTimerPaused = false;
timeElapsed = 0;

// Coins
coins = 0;
mostCoins = 0;
coinsInBank = 0;

// Obstacles
obstacles = [oGraphEater, oSpikes, oCloud];
baseMinObstacleTime = 600;
baseMaxObstacleTime = 900;
lowestMinObstacleTime = 180;
lowestMaxObstacleTime = 300;
minObstacleTime = lowestMinObstacleTime;
maxObstacleTime = lowestMaxObstacleTime;
obstacleTimer = irandom_range(minObstacleTime, maxObstacleTime);

// Clock
stepsBetweenClocks = 1800;
clockTimer = stepsBetweenClocks;

// Powerups
//powerups = [oPowerupShield, oPowerupAirJump];
powerups = [oPowerupAirJump];
minStepsBetweenPowerups = 1800;
maxStepsBetweenPowerups = 3600;
powerupTimer = irandom_range(minStepsBetweenPowerups, maxStepsBetweenPowerups);
powerupTimer = 180;

#region Coin Rush Functions

/// @func	startGameCoinRush();
startGameCoinRush = function()
{
	// Start timers
	gameTimer = 59;
	gameCounter = 0;
	timeElapsed = 0;
	minObstacleTime = baseMinObstacleTime;
	maxObstacleTime = baseMaxObstacleTime;
	obstacleTimer = irandom_range(minObstacleTime, maxObstacleTime);
	clockTimer = stepsBetweenClocks;
		
	// Reset coins
	coins = 0;
	
	// Spawn/activate first coin
	var _coin = instance_create_layer(random_range(24,168),random_range(24,168),"Instances",oCoin);
	with (_coin)
	{
		activate();
	}
	
	// Start game
	gameStarted = true;
	
	// Start music
	audio_play_sound(mChillinInACalculator, 3, true);
}

/// @func	endGameCoinRush();
endGameCoinRush = function()
{
	// Destroy all game objects
	instance_destroy(oCollectable);
	instance_destroy(oObstacle);
			
	// Spawn home coins
	instance_create_layer(96,96,"Instances",oModeCoin);
	instance_create_layer(160,160,"Instances",oShopCoin);
			
	// Highscore
	if (coins > mostCoins)
	{
		// Save new high score to disk
		mostCoins = coins;
		ini_open("save.ini");
		ini_write_real("high_scores","most_coins",mostCoins);
		ini_close();
	}
	
	// Game over sound
	audio_play_sound(sfxGameOver, 2, false);
			
	// Zero graph cooldowns
	with (oGrapher)
	{
		for (var _i = 0; _i < array_length(graphs); _i++)
		{
			graphs[_i][2] = 0;
		}
	}
	
	// Reset variables
	gameTimer = 0;
	
	// End game
	gameStarted = false;
	
	// Add coins to the bank
	coinsInBank += coins;
	
	// Clear powerups
	with (oPlayer)
	{
		shield = 0;
		canAirJump = false;
		airJumps = 0;
	}
	
	// Stop music
	audio_stop_sound(mChillinInACalculator);
}

#endregion

// Coin Sprites (HUD)
var _coinsSpriteInstance = instance_create_layer(8,8,"HUDInstances",oSprite);
with (_coinsSpriteInstance)
{
	sprite_index = sCoin;
	spins = true;
}
var _mostCoinsSpriteInstance = instance_create_layer(144,8,"HUDInstances",oSprite);
with (_mostCoinsSpriteInstance)
{
	sprite_index = sCoinHighScore;
	spins = true;
}

// Get high score from disk
ini_open("save.ini");
mostCoins = ini_read_real("high_scores","most_coins",0);
ini_close();
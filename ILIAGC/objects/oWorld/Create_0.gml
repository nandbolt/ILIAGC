// States
gameStarted = false;
gameMode = Mode.COIN_RUSH;

// Theme
currentTheme = Theme.DEFAULT;

// Shader
currentShader = shdrPass;

// Timer
gameTimer = 0;
gameCounter = 0;
gameTimerPaused = false;
timeElapsed = 0;

// Coins
coins = 0;
coinsInBank = 0;
mostCoins = 0;
coinRushMostCoins = 0;
soccerMostCoins = 0;

// Obstacles
obstacles = [oGraphEater, oSpikes, oCloud, oBubbleGum, oSpider];
baseMinObstacleTime = 600;
baseMaxObstacleTime = 900;
lowestMinObstacleTime = 180;
lowestMaxObstacleTime = 300;
minObstacleTime = lowestMinObstacleTime;
maxObstacleTime = lowestMaxObstacleTime;
obstacleTimer = irandom_range(minObstacleTime, maxObstacleTime);

// Clock
timeBetweenNormalClocks = 30;
timeBetweenBonusClocks = 300;

// Powerups
powerups = [oPowerupShield];
minStepsBetweenPowerups = 1800;
maxStepsBetweenPowerups = 3600;
minStepsBetweenPowerups = 180;
maxStepsBetweenPowerups = 180;
powerupTimer = irandom_range(minStepsBetweenPowerups, maxStepsBetweenPowerups);

#region Mode Functions

/// @func	startGame({int} mode);
startGame = function(_mode)
{
	// Set game mode
	gameMode = _mode;
	
	// Set counters
	gameTimer = 59;
	gameCounter = 0;
	timeElapsed = 0;
	minObstacleTime = baseMinObstacleTime;
	maxObstacleTime = baseMaxObstacleTime;
	obstacleTimer = irandom_range(minObstacleTime, maxObstacleTime);
		
	// Reset coins
	coins = 0;
	
	// Start game
	gameStarted = true;
	
	// Start music
	audio_play_sound(mChillinInACalculator, 3, true);
	
	// Start game mode
	switch (gameMode)
	{
		case Mode.SOCCER:
			startGameSoccer();
			break;
		default:
			startGameCoinRush();
	}
}

/// @func	endGame();
endGame = function()
{
	// Destroy all game objects
	instance_destroy(oCollectable);
	instance_destroy(oObstacle);
	
	// Spawn home coins
	spawnHomeCoins();
	
	// Game over sound
	audio_play_sound(sfxGameOver, 2, false);
			
	// Reset equations
	with (oGrapher)
	{
		for (var _i = 0; _i < array_length(graphs); _i++)
		{
			// Clear equation
			graphs[_i][0] = [];
			
			// Clear cooldown
			graphs[_i][2] = 0;
		}
	}
	
	// Destroy all graphs
	instance_destroy(oGraph);
	
	// Reset variables
	gameTimer = 0;
	
	// End game
	gameStarted = false;
	
	// Add coins to the bank
	coinsInBank += coins;
	
	// Clear effects
	with (oPlayer)
	{
		// Shield
		shield = 0;
		
		// Air jump
		canAirJump = false;
		airJumps = 0;
		
		// Invincible
		invinciblePowerActive = false;
		invincible = false;
		
		// Bubble gum
		bubbleGumTimer = 0;
		collisionType = Collision.SLIDE;
		
		// Block
		blocks = 0;
	}
	with (oGrapher)
	{
		// Iron graphs
		ironGraphTimer = 0;
	}
	if (instance_exists(oBlock)) instance_destroy(oBlock);
	if (instance_exists(oBall)) instance_destroy(oBall);
	
	// Stop music
	audio_stop_sound(mChillinInACalculator);
	
	switch (gameMode)
	{
		case Mode.SOCCER:
			endGameSoccer()
			break;
		default:
			endGameCoinRush();
	}
}

#region Coin Rush Functions

/// @func	startGameCoinRush();
startGameCoinRush = function()
{	
	// Spawn/activate first coin
	var _coin = instance_create_layer(random_range(24,168),random_range(24,168),"Instances",oCoin);
	with (_coin)
	{
		activate();
	}
}

/// @func	endGameCoinRush();
endGameCoinRush = function()
{	
	// Highscore
	if (coins > coinRushMostCoins)
	{
		// Save new high score to disk
		coinRushMostCoins = coins;
		ini_open("save.ini");
		ini_write_real("high_scores","coin_rush",coins);
		ini_close();
		mostCoins = coins;
	}
}

#endregion

#region Soccer Functions

/// @func	startGameSoccer();
startGameSoccer = function()
{
	// Spawn/activate first coin
	var _coin = instance_create_layer(random_range(24,168),random_range(24,168),"Instances",oCoinRed);
	with (_coin)
	{
		activate();
	}
	
	// Spawn soccer ball
	instance_create_layer(96,160,"Instances",oBallSoccer);
}

/// @func	endGameSoccer();
endGameSoccer = function()
{
	// Highscore
	if (coins > soccerMostCoins)
	{
		// Save new high score to disk
		soccerMostCoins = coins;
		ini_open("save.ini");
		ini_write_real("high_scores","soccer",coins);
		ini_close();
		mostCoins = coins;
	}
}

#endregion

#endregion

/// @func	spawnHomeCoins();
spawnHomeCoins = function()
{
	// Game modes
	instance_create_layer(96, 96, "Instances", oModeCoin);
	if (oGame.myModes[Mode.SOCCER][1] > 0)
	{
		var _mode = instance_create_layer(48, 96, "Instances", oModeCoin);
		with (_mode)
		{
			description = "Soccer";
			mode = Mode.SOCCER;
		}
	}
	
	// Shop
	instance_create_layer(160, 160, "Instances", oShopCoin);
	
	// Storage
	instance_create_layer(32, 160, "Instances", oStorageCoin);
}

// Coin Sprites (HUD)
var _coinsSpriteInstance = instance_create_layer(8,8,"HUDInstances",oSprite);
with (_coinsSpriteInstance)
{
	sprite_index = sCoinGold;
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
coinRushMostCoins = ini_read_real("high_scores","coin_rush",0);
soccerMostCoins = ini_read_real("high_scores","soccer",0);
ini_close();
mostCoins = coinRushMostCoins;

// Spawn player
instance_create_layer(96, 144, "Instances", oPlayerHuman);

// Spawn home coins
spawnHomeCoins();
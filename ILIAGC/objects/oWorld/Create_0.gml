// Dimensions
spawnMinX = 24;
spawnMinY = 24;
spawnMaxX = 168;
spawnMaxY = 168;
cloudSpawnMaxY = 84;

// States
gameStarted = false;
gameMode = Mode.COIN_RUSH;

// Theme
currentTheme = Theme.DEFAULT;
currentShader = shdrPass;
currentSong = mChillinInACalculator;

// Timer
gameTimer = 0;
gameCounter = 0;
gameTimerPaused = false;
timeElapsed = 0;
maxDifficultyTime = 1200;
difficultyFactor = 0;

// Coins
coins = 0;
coinsInBank = 0;
mostCoins = 0;
coinRushMostCoins = 0;
soccerMostCoins = 0;
puzzleMostCoins = 0;

// Combo
comboMeter = 0;
comboTimer = 0;
comboTime = 300;
comboThreshold = 10;

// Shop
shopItems = [];
shopRerollPrice = 0;

// Obstacles
obstacles = [oGraphEater, oSpikes, oCloud, oBubbleGum, oSpider];
baseMinObstacleTime = 600;
baseMaxObstacleTime = 900;
lowestMinObstacleTime = 300;
lowestMaxObstacleTime = 600;
obstacleTimer = 0;
obstaclesToSpawn = [];
maxObstacleCount = 20;
maxObstacleSpawnCount = 10;
minObstacleSpawnCountFactor = 0.4;
maxObstacleSpawnCountFactor = 0.9;

// Clock
timeBetweenNormalClocks = 30;
timeBetweenBonusClocks = 300;

// Powerups
powerups = [];
baseMinStepsBetweenPowerups = 2700;
baseMaxStepsBetweenPowerups = 3600;
powerupTimer = 0;
powerupDiversity = 0;

// Soccer
soccerLowestCoinSpawnY = 112;

// Highscore
highscore = false;

#region Mode Functions

/// @func	startGame({int} mode);
startGame = function(_mode)
{
	// Set game mode
	gameMode = _mode;
	
	// Powerup diversity
	var _powerupCount = array_length(powerups);
	if (_powerupCount < 2) powerupDiversity = 0;
	else powerupDiversity = clamp(_powerupCount / array_length(oGame.myPowerups), 0, 1);
	
	// Reset counters
	gameTimer = 60;
	gameCounter = 0;
	timeElapsed = 0;
	difficultyFactor = 0;
	highscore = false;
	comboMeter = 0;
	comboTimer = 0;
	updateObstacleTimer();
	updatePowerupTimer();
		
	// Reset coins
	coins = 0;
	
	// Start game
	gameStarted = true;
	
	// Start music
	audio_play_sound(currentSong, 3, true);
	
	// Start game mode
	switch (gameMode)
	{
		case Mode.SOCCER:
			startGameSoccer();
			break;
		case Mode.PUZZLE:
			startGamePuzzle();
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
	
	// Save coins
	ini_open("save.ini");
	ini_write_real("inventory", "coins_in_bank", oWorld.coinsInBank);
	ini_close();
	
	// Clear effects
	with (oPlayer)
	{
		// Shield
		shield = 0;
		
		// Air jump
		airJumps = 0;
		
		// Invincible
		invinciblePowerActive = false;
		invincible = false;
		deathTouch = false;
		
		// Bubble gum
		bubbleGumTimer = 0;
		collisionType = Collision.SLIDE;
		
		// Block
		blocks = 0;
	}
	with (oGrapher)
	{
		// Iron graphs
		ironGraphs = 0;
	}
	if (instance_exists(oBlock)) instance_destroy(oBlock);
	if (instance_exists(oBall)) instance_destroy(oBall);
	
	// Stop music
	audio_stop_sound(currentSong);
	
	// Set alarm buffer (before home coins spawn)
	alarm[0] = 120;
	
	// Restock shop
	shopRestock();
	
	// Game mode specific
	switch (gameMode)
	{
		case Mode.SOCCER:
			endGameSoccer();
			break;
		case Mode.PUZZLE:
			endGamePuzzle();
			break;
		default:
			endGameCoinRush();
	}
}

#region Coin Rush Functions

/// @func	startGameCoinRush();
startGameCoinRush = function()
{
	// Set highscore display
	mostCoins = coinRushMostCoins;
	
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
		highscore = true;
	}
	
	// If coin challenge (GX Games)
	if (os_type == os_gxgames &&
		global.currentChallenge == global.challengeIdCoinRush &&
		coins > global.currentHighScore)
	{
		// Submit score
		gxc_challenge_submit_score(coins);
		global.currentHighScore = coins;
	}
}

#endregion

#region Soccer Functions

/// @func	startGameSoccer();
startGameSoccer = function()
{
	// Set highscore display
	mostCoins = soccerMostCoins;
	
	// Spawn/activate first coin
	var _coin = instance_create_layer(random_range(spawnMinX,spawnMaxX), random_range(spawnMinY,spawnMaxY), "Instances", oCoinSilver);
	with (_coin)
	{
		activate();
	}
	
	// Spawn soccer ball
	instance_create_layer(96, 32, "Instances", oBallSoccer);
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
		ini_write_real("high_scores", "soccer", coins);
		ini_close();
		mostCoins = coins;
		highscore = true;
	}
}

#endregion

#region Puzzle Functions

/// @func	startGamePuzzle();
startGamePuzzle = function()
{
	// Set highscore display
	mostCoins = puzzleMostCoins;
	
	// Spawn/activate first coin
	var _coin = instance_create_layer(random_range(spawnMinX,spawnMaxX), random_range(spawnMinY,soccerLowestCoinSpawnY), "Instances", oCoin);
	with (_coin)
	{
		activate();
	}
	
	// Spawn graph eater pattern
	spawnPuzzle();
}

/// @func	endGamePuzzle();
endGamePuzzle = function()
{
	// Highscore
	if (coins > puzzleMostCoins)
	{
		// Save new high score to disk
		puzzleMostCoins = coins;
		ini_open("save.ini");
		ini_write_real("high_scores", "puzzle", coins);
		ini_close();
		mostCoins = coins;
		highscore = true;
	}
}

#endregion

#endregion

/// @func	spawnHomeCoins();
spawnHomeCoins = function()
{
	// Game modes
	instance_create_layer(96, 96, "BackgroundInstances", oModeCoin);
	if (oGame.myModes[Mode.SOCCER][1] > 0)
	{
		var _mode = instance_create_layer(48, 96, "BackgroundInstances", oModeCoin);
		with (_mode)
		{
			description = "Soccer";
			mode = Mode.SOCCER;
			longDescription = getModeDescription(Mode.SOCCER);
			sprite_index = getModeSprite(Mode.SOCCER);
		}
	}
	if (oGame.myModes[Mode.PUZZLE][1] > 0)
	{
		var _mode = instance_create_layer(48 + 96, 96, "BackgroundInstances", oModeCoin);
		with (_mode)
		{
			description = "Puzzle";
			mode = Mode.PUZZLE;
			longDescription = getModeDescription(Mode.PUZZLE);
			sprite_index = getModeSprite(Mode.PUZZLE);
		}
	}
	
	// Shop
	instance_create_layer(160, 168, "BackgroundInstances", oShopCoin);
	
	// Storage
	instance_create_layer(32, 168, "BackgroundInstances", oStorageCoin);
	
	// Tutorial
	instance_create_layer((160 - 32) * 0.5, 168, "BackgroundInstances", oTutorialCoin);
}

/// @func	spawnPlayer({int} playerId, *{id} playerObject, *{real} x, *{real} y, *{real} velocityX, *{real} velocityY);
spawnPlayer = function(_playerId, _playerObject = oPlayerHuman, _x = 96, _y = 144, _velocityX = 0, _velocityY = 0)
{
	// Init player already spawned
	var _playerAlreadySpawned = false;
	
	// Check player already spawned
	if (instance_exists(oPlayer))
	{
		with (oPlayer)
		{
			// Set player already spawned
			if (playerId == _playerId) _playerAlreadySpawned = true;
		}
	}
	
	// If player hasn't spawned
	if (!_playerAlreadySpawned)
	{
		// Spawn player
		var _player = instance_create_layer(_x, _y, "Instances", _playerObject);
		with (_player)
		{
			// Set/return id
			playerId = _playerId;
			if (playerId == 1) playerColor = c_aqua;
			else if (playerId == 2) playerColor = c_lime;
			else if (playerId == 3) playerColor = c_yellow;
			velocity.x = _velocityX;
			velocity.y = _velocityY;
			return id;
		}
	}
	else return noone;
}

/// @func	despawnPlayer({int} playerId);
despawnPlayer = function(_playerId)
{
	// Check player already spawned
	with (oPlayer)
	{
		// Destroy correct player
		if (playerId == _playerId) instance_destroy();
	}
}

/// @func	updateObstacleTimer();
updateObstacleTimer = function()
{
	var _minTime = baseMinObstacleTime - (baseMinObstacleTime - lowestMinObstacleTime) * difficultyFactor;
	var _maxTime = baseMaxObstacleTime - (baseMaxObstacleTime - lowestMaxObstacleTime) * difficultyFactor;
	obstacleTimer = irandom_range(_minTime, _maxTime);
}

/// @func	updatePowerupTimer();
updatePowerupTimer = function()
{
	var _minTime = baseMinStepsBetweenPowerups - 900 * powerupDiversity;
	var _maxTime = baseMaxStepsBetweenPowerups - 900 * powerupDiversity;
	powerupTimer = irandom_range(_minTime, _maxTime);
}

// Coin Sprites (HUD)
coinHudIcon = instance_create_layer(8,8,"HUDInstances",oSprite);
with (coinHudIcon)
{
	sprite_index = sCoinGold;
	spins = true;
}
with (instance_create_layer(168,8,"HUDInstances",oSprite))
{
	sprite_index = sCoinHighScore;
	spins = true;
}
with (instance_create_layer(76,8,"HUDInstances",oSprite))
{
	sprite_index = sClock;
	spins = true;
}

// Open save
ini_open("save.ini");

// Coins
coinsInBank = ini_read_real("inventory", "coins_in_bank", 0);
coinRushMostCoins = ini_read_real("high_scores","coin_rush",0);
soccerMostCoins = ini_read_real("high_scores","soccer",0);

// Theme
setTheme(ini_read_real("inventory", "theme", Theme.DEFAULT));

// Powerups
if (ini_read_real("inventory", getPowerupSaveName(Powerup.SHIELD), 1) > 0) setPowerup(Powerup.SHIELD);
if (ini_read_real("inventory", getPowerupSaveName(Powerup.AIR_JUMP), 0) > 0) setPowerup(Powerup.AIR_JUMP);
if (ini_read_real("inventory", getPowerupSaveName(Powerup.INVINCIBLE), 0) > 0) setPowerup(Powerup.INVINCIBLE);
if (ini_read_real("inventory", getPowerupSaveName(Powerup.BALL), 0) > 0) setPowerup(Powerup.BALL);
if (ini_read_real("inventory", getPowerupSaveName(Powerup.IRON_GRAPH), 0) > 0) setPowerup(Powerup.IRON_GRAPH);
if (ini_read_real("inventory", getPowerupSaveName(Powerup.BLOCK), 0) > 0) setPowerup(Powerup.BLOCK);

// Misc
if (ini_read_real("inventory", getMiscSaveName(Misc.DEBUG_MODE), 0) > 0) setMisc(Misc.DEBUG_MODE);

// Player
spawnPlayer(0, getCharacterObject(ini_read_real("inventory", "character", 0)), 96, 175);

// Close save
ini_close();
mostCoins = coinRushMostCoins;

// Spawn home coins
spawnHomeCoins();

// Restock shop
shopRestock();
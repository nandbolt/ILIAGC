// Inherit the parent event
event_inherited();

// Coin
active = false;
nextCoin = noone;
value = 1;

// Thresholds
silverThreshold = 0.25;
redThreshold = 0.5;
blueThreshold = 0.75;

/// @func	onCollect();
onCollect = function()
{
	// Update coins
	oWorld.coins += value;
	
	// Update combo
	oWorld.comboTimer = oWorld.comboTime;
	oWorld.comboMeter++;
	
	// Make sure there is another coin
	if (nextCoin == noone) spawnNextCoin();
	
	// Activate next coin
	with (nextCoin)
	{
		activate();
	}
}

/// @func	onActivate();
onActivate = function()
{
	// Set alpha
	image_alpha = 1;
	
	// Spawn the next coin
	spawnNextCoin();
}

/// @func	spawnNextCoin();
spawnNextCoin = function()
{
	// Init coin parameters
	var _coin = oCoin;
	var _maxY = oWorld.spawnMaxY;
	var _difficultyFactor = oWorld.difficultyFactor;
	if (oWorld.gameMode == Mode.SOCCER)
	{
		// Set coin max y
		_maxY = oWorld.soccerLowestCoinSpawnY;
		_difficultyFactor = clamp(_difficultyFactor + silverThreshold, 0, blueThreshold);
	}
	
	// Combo
	if (oWorld.comboMeter >= oWorld.comboThreshold) _difficultyFactor += silverThreshold;
	
	// Choose coin
	if (_difficultyFactor > 1) _coin = oCoinBlack;
	else if (_difficultyFactor >= blueThreshold) _coin = oCoinBlue;
	else if (_difficultyFactor >= redThreshold) _coin = oCoinRed;
	else if (_difficultyFactor >= silverThreshold) _coin = oCoinSilver;
	
	// Spawn coin
	var _x = random_range(oWorld.spawnMinX, oWorld.spawnMaxX), _y = random_range(oWorld.spawnMinY, _maxY);
	nextCoin = instance_create_layer(_x, _y, "Instances", _coin);
}

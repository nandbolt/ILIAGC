// Inherit the parent event
event_inherited();

// Coin
active = false;
nextCoin = noone;
value = 1;
goldBound = 300;
silverBound = 600;
redBound = 900;

/// @func	onCollect();
onCollect = function()
{
	// Update coins
	oWorld.coins += value;
	
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
	var _coin = oCoinBlue;
	if (oWorld.gameMode == Mode.SOCCER)
	{
		if (oWorld.timeElapsed < goldBound) _coin = oCoinRed;
		else if (oWorld.timeElapsed < silverBound) _coin = oCoinBlue;
		else if (oWorld.timeElapsed < redBound) _coin = oCoinBlue;
	}
	else
	{
		if (oWorld.timeElapsed < goldBound) _coin = oCoin;
		else if (oWorld.timeElapsed < silverBound) _coin = oCoinSilver;
		else if (oWorld.timeElapsed < redBound) _coin = oCoinRed;
	}
	nextCoin = instance_create_layer(random_range(24,168),random_range(24,168),"Instances",_coin);
}

// Set alpha
image_alpha = 0.25;
// Inherit the parent event
event_inherited();

// Coin
active = false;
nextCoin = noone;
value = 1;
goldBound = 120;
silverBound = 300;
redBound = 600;

/// @func	onCollect();
onCollect = function()
{
	// Update coins
	oWorld.coins += value;
	
	// Make sure there is another coin
	if (nextCoin == noone)
	{
		var _coin = oCoinBlue;
		if (oWorld.timeElapsed < goldBound) _coin = oCoin;
		else if (oWorld.timeElapsed < silverBound) _coin = oCoinSilver;
		else if (oWorld.timeElapsed < redBound) _coin = oCoinRed;
		nextCoin = instance_create_layer(random_range(24,168),random_range(24,168),"Instances",_coin);
	}
	
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
	var _coin = oCoinBlue;
	if (oWorld.timeElapsed < goldBound) _coin = oCoin;
	else if (oWorld.timeElapsed < silverBound) _coin = oCoinSilver;
	else if (oWorld.timeElapsed < redBound) _coin = oCoinRed;
	nextCoin = instance_create_layer(random_range(24,168),random_range(24,168),"Instances",_coin);
}

// Set alpha
image_alpha = 0.25;
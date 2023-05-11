// Inherit the parent event
event_inherited();

// Coin
active = false;
nextCoin = noone;

/// @func	onCollect();
onCollect = function()
{
	// Update coins
	oWorld.coins++;
	
	// Make sure there is another coin
	if (nextCoin == noone) nextCoin = instance_create_layer(random_range(24,168),random_range(24,168),"Instances",oCoin);
	
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
	nextCoin = instance_create_layer(random_range(24,168),random_range(24,168),"Instances",oCoin);
}

// Set alpha
image_alpha = 0.25;
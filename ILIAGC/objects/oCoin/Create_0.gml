// Inherit the parent event
event_inherited();

// Coin
active = false;
nextCoin = noone;

/// @func	onCollect();
onCollect = function()
{
	// Change to world scope
	with (oWorld)
	{
		// Update coins
		coins++;
	}
	
	// Make sure there is another coin
	if (nextCoin == noone) nextCoin = instance_create_layer(random_range(24,168),random_range(24,168),"Instances",oCoin);
	
	// Activate next coin
	with (nextCoin)
	{
		activate();
	}
}

/// @func	activate();
activate = function()
{
	// Set active state
	active = true;
	image_alpha = 1;
	
	// Spawn the next coin
	nextCoin = instance_create_layer(random_range(24,168),random_range(24,168),"Instances",oCoin);
}

// Set alpha
image_alpha = 0.25;
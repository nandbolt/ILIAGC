// Inherit the parent event
event_inherited();

// Text
description = "Shop";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Spawn shop coins
	instance_create_layer(96, 160, "Instances", oHomeCoin);
	for (var _y = 64; _y <= 128; _y += 64)
	{
		for (var _x = 48; _x <= 144; _x += 48)
		{
			instance_create_layer(_x, _y, "Instances", oShopItemCoin);
		}
	}
}
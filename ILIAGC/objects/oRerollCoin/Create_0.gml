// Inherit the parent event
event_inherited();

// Text
description = "Reroll";
longDescription = "Rerolls the items in the shop for a price.";
price = oWorld.shopRerollPrice;

/// @func	collect();
collect = function()
{
	// Respawn shop
	with (oShopItemCoin)
	{
		// Destroy item if not reroll coin
		if (object_index != oRerollCoin) instance_destroy();
	}
	shopRestock();
	shopSpawnItems();
	
	// Increase price
	price += 50;
	oWorld.shopRerollPrice = price;
	
	// Collect sound
	audio_play_sound(collectSound, 1, false);
}
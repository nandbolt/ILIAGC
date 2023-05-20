// Change scope to collectable
with (other)
{
	// If active
	if (active)
	{
		// Set nearby timer
		nearbyTimer = 2;
		
		// If interacted
		if (other.interactPressed)
		{
			// If shop item
			if (object_index == oShopItemCoin || object_is_ancestor(object_index, oShopItemCoin))
			{
				// Exit if can't afford it
				if (oWorld.coinsInBank < price) exit;
				// Else pay the price
				else oWorld.coinsInBank -= price;
			}
		
			// Collect
			collect();
		}
	}
}
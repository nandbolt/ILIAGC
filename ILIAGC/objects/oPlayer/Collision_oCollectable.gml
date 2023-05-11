// Change scope to collectable
with (other)
{
	// If active
	if (active)
	{
		// If shop item
		if (object_index == oShopItemCoin || object_is_ancestor(self, oShopItemCoin))
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
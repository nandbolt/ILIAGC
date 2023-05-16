// Change scope to collectable
with (other)
{
	// If active
	if (active)
	{
		// If shop item
		if (object_index == oShopItemCoin || object_is_ancestor(object_index, oShopItemCoin))
		{
			// Exit if can't afford it
			if (oWorld.coinsInBank < price) exit;
			// Else pay the price
			else oWorld.coinsInBank -= price;
		}
		// Exit if coin and playing soccer
		else if (oWorld.gameMode == Mode.SOCCER && (object_index == oCoin || object_is_ancestor(object_index, oCoin))) exit;
		
		// Collect
		collect();
	}
}
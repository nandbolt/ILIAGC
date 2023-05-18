// Inherit the parent event
event_inherited();

// Text
description = "Shop";

/// @func	onCollect();
onCollect = function()
{
	// Destroy all coins
	instance_destroy(oCollectable);
	
	// Home coin
	instance_create_layer(96, 168, "Instances", oHomeCoin);
	
	// Gather all potential shop items
	var _shopItems = [], _lvl = 0;
	for (var _i = 0; _i < array_length(oGame.myPowerups); _i++)
	{
		_lvl = oGame.myPowerups[_i][1];
		if (_lvl < oGame.myPowerups[_i][2]) array_push(_shopItems, [ShopItem.POWERUP, oGame.myPowerups[_i][0]]);
	}
	for (var _i = 0; _i < array_length(oGame.myUpgrades); _i++)
	{
		_lvl = oGame.myUpgrades[_i][1];
		if (_lvl == 0) array_push(_shopItems, [ShopItem.UPGRADE, oGame.myUpgrades[_i][0]]);
	}
	for (var _i = 0; _i < array_length(oGame.myMisc); _i++)
	{
		_lvl = oGame.myMisc[_i][1];
		if (_lvl == 0) array_push(_shopItems, [ShopItem.MISC, oGame.myMisc[_i][0]]);
	}
	for (var _i = 0; _i < array_length(oGame.myTheme); _i++)
	{
		_lvl = oGame.myTheme[_i][1];
		if (_lvl == 0) array_push(_shopItems, [ShopItem.THEME, oGame.myTheme[_i][0]]);
	}
	for (var _i = 0; _i < array_length(oGame.myCharacters); _i++)
	{
		_lvl = oGame.myCharacters[_i][1];
		if (_lvl == 0) array_push(_shopItems, [ShopItem.CHARACTER, oGame.myCharacters[_i][0]]);
	}
	for (var _i = 0; _i < array_length(oGame.myModes); _i++)
	{
		_lvl = oGame.myModes[_i][1];
		if (_lvl == 0) array_push(_shopItems, [ShopItem.MODE, oGame.myModes[_i][0]]);
	}
	for (var _i = 0; _i < array_length(oGame.myFoods); _i++)
	{
		array_push(_shopItems, [ShopItem.FOOD, oGame.myFoods[_i][0]]);
	}
	
	// Show available shop items
	for (var _j = 0; _j < 2; _j++)
	{
		for (var _i = 0; _i < 3; _i++)
		{
			// Get position
			var _x = 48 + _i * 48, _y = 136 - _j * 32;
			
			// If shop has inventory
			if (array_length(_shopItems) > 0)
			{
				// Get shop item
				var _k = irandom(array_length(_shopItems) - 1);
				var _shopItemType = _shopItems[_k][0], _shopItemIdx = _shopItems[_k][1];
				
				// Spawn item
				shopSpawnItem(_shopItemType, _shopItemIdx, _x, _y);
				
				// Remove from inventory
				array_delete(_shopItems, _k, 1);
			}
		}
	}
}
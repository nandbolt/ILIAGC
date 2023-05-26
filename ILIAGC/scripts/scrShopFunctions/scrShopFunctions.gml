/// @func	shopRestock();
function shopRestock()
{
	// Reset shop items
	with (oWorld)
	{
		shopItems = [];
		shopRerollPrice = 0;
	}
	
	
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
	
	// Spawn at most 6 items
	repeat (6)
	{
		// If there are items available
		if (array_length(_shopItems) > 0)
		{
			// Get random shop item
			var _k = irandom(array_length(_shopItems) - 1);
			var _shopItem = [_shopItems[_k][0], _shopItems[_k][1]];
				
			// Add item to shop and remove from truck
			array_push(oWorld.shopItems, _shopItem);
			array_delete(_shopItems, _k, 1);
		}
	}
}

/// @func	shopSpawnItems();
function shopSpawnItems()
{
	// Loop through shop items
	for (var _k = 0; _k < array_length(oWorld.shopItems); _k++)
	{
		// Spawn item at correct location
		var _x = 48 + (_k % 3) * 48, _y = 136 - floor(_k / 3) * 32;
		shopSpawnItem(oWorld.shopItems[_k][0], oWorld.shopItems[_k][1], _x, _y);
	}
}

/// @func	shopSpawnItem({int} itemType, {int} itemIdx, {real} x, {real} y);
function shopSpawnItem(_itemType, _itemIdx, _x, _y)
{
	switch (_itemType)
	{
		case ShopItem.POWERUP:
			shopSpawnItemPowerup(_itemIdx, _x, _y);
			break;
		case ShopItem.UPGRADE:
			shopSpawnItemUpgrade(_itemIdx, _x, _y);
			break;
		case ShopItem.CHARACTER:
			shopSpawnItemCharacter(_itemIdx, _x, _y);
			break;
		case ShopItem.MODE:
			shopSpawnItemMode(_itemIdx, _x, _y);
			break;
		case ShopItem.FOOD:
			shopSpawnItemFood(_itemIdx, _x, _y);
			break;
		case ShopItem.THEME:
			shopSpawnItemTheme(_itemIdx, _x, _y);
			break;
		case ShopItem.MISC:
			shopSpawnItemMisc(_itemIdx, _x, _y);
			break;
	}
}

/// @func	shopSpawnItemPowerup({int} idx, {real} x, {real} y);
function shopSpawnItemPowerup(_idx, _x, _y)
{
	var _shopItem = instance_create_layer(_x, _y, "Instances", oShopItemPowerup);
	var _lvl = oGame.myPowerups[_idx][1] + 1;
	with (_shopItem)
	{
		// Item
		itemIdx = _idx;
		itemType = ShopItem.POWERUP;
		
		// Other
		description = getPowerupName(_idx, _lvl);
		itemName = getPowerupSaveName(_idx);
		longDescription = getPowerupDescription(_idx, _lvl);
		sprite_index = getPowerupSprite(_idx, _lvl);
		price = getPowerupCost(_idx, _lvl);
	}
}

/// @func	shopSpawnItemUpgrade({int} idx, {real} x, {real} y);
function shopSpawnItemUpgrade(_idx, _x, _y)
{
	var _shopItem = instance_create_layer(_x, _y, "Instances", oShopItemUpgrade);
	with (_shopItem)
	{
		// Item
		itemIdx = _idx;
		itemType = ShopItem.UPGRADE;
		
		// Other
		description = getUpgradeName(_idx);
		itemName = getUpgradeSaveName(_idx);
		longDescription = getUpgradeDescription(_idx);
		sprite_index = getUpgradeSprite(_idx);
		price = getUpgradeCost(_idx);
	}
}

/// @func	shopSpawnItemMisc({int} idx, {real} x, {real} y);
function shopSpawnItemMisc(_idx, _x, _y)
{
	var _shopItem = instance_create_layer(_x, _y, "Instances", oShopItemMisc);
	with (_shopItem)
	{
		// Item
		itemIdx = _idx;
		itemType = ShopItem.MISC;
		
		// Other
		description = getMiscName(_idx);
		itemName = getMiscSaveName(_idx);
		longDescription = getMiscDescription(_idx);
		sprite_index = getMiscSprite(_idx);
		price = getMiscCost(_idx);
	}
}

/// @func	shopSpawnItemTheme({int} idx, {real} x, {real} y);
function shopSpawnItemTheme(_idx, _x, _y)
{
	var _shopItem = instance_create_layer(_x, _y, "Instances", oShopItemTheme);
	with (_shopItem)
	{
		// Item
		itemIdx = _idx;
		itemType = ShopItem.THEME;
		
		// Other
		description = getThemeName(_idx);
		itemName = getThemeSaveName(_idx);
		longDescription = getThemeDescription(_idx);
		sprite_index = getThemeSprite(_idx);
		price = getThemeCost(_idx);
	}
}

/// @func	shopSpawnItemCharacter({int} idx, {real} x, {real} y);
function shopSpawnItemCharacter(_idx, _x, _y)
{
	var _shopItem = instance_create_layer(_x, _y, "Instances", oShopItemCharacter);
	with (_shopItem)
	{
		// Item
		itemIdx = _idx;
		itemType = ShopItem.CHARACTER;
		
		// Other
		description = getCharacterName(_idx);
		itemName = getCharacterSaveName(_idx);
		longDescription = getCharacterDescription(_idx);
		sprite_index = getCharacterSprite(_idx);
		price = getCharacterCost(_idx);
	}
}

/// @func	shopSpawnItemMode({int} idx, {real} x, {real} y);
function shopSpawnItemMode(_idx, _x, _y)
{
	var _shopItem = instance_create_layer(_x, _y, "Instances", oShopItemMode);
	with (_shopItem)
	{
		// Item
		itemIdx = _idx;
		itemType = ShopItem.MODE;
		
		// Other
		description = getModeName(_idx);
		itemName = getModeSaveName(_idx);
		longDescription = getModeDescription(_idx);
		sprite_index = getModeSprite(_idx);
		price = getModeCost(_idx);
	}
}

/// @func	shopSpawnItemFood({int} idx, {real} x, {real} y);
function shopSpawnItemFood(_idx, _x, _y)
{
	var _shopItem = instance_create_layer(_x, _y, "Instances", oShopItemFood);
	with (_shopItem)
	{
		// Item
		itemIdx = _idx;
		itemType = ShopItem.FOOD;
		
		// Other
		description = getFoodName(_idx);
		longDescription = getFoodDescription(_idx);
		sprite_index = getFoodSprite(_idx);
		price = getFoodCost(_idx);
	}
}
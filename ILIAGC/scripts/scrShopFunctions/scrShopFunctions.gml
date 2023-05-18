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
		// Set shop item info
		powerup = _idx;
		description = getPowerupName(_idx, _lvl);
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
		// Set shop item info
		misc = _idx;
		description = getUpgradeName(_idx);
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
		// Set shop item info
		misc = _idx;
		description = getMiscName(_idx);
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
		// Set shop item info
		theme = _idx;
		description = getThemeName(_idx);
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
		// Set shop item info
		character = _idx;
		description = getCharacterName(_idx);
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
		// Set shop item info
		mode = _idx;
		description = getModeName(_idx);
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
		// Set shop item info
		food = _idx;
		description = getFoodName(_idx);
		sprite_index = getFoodSprite(_idx);
		price = getFoodCost(_idx);
	}
}
/// @func	shopSpawnItemPowerup({int} idx, {real} x, {real} y, {int} level);
function shopSpawnItemPowerup(_idx, _x, _y, _level)
{
	var _shopItem = instance_create_layer(_x, _y, "Instances", oShopItemPowerup);
	with (_shopItem)
	{
		// Set shop item info
		powerup = _idx;
		description = getPowerupName(_idx);
		sprite_index = getPowerupSprite(_idx);
		price = getPowerupCost(_idx);
		level = _level;
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
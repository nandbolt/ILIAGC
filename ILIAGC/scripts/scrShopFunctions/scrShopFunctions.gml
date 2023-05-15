/// @func	shopSpawnItemPowerup({int} idx, {real} x, {real} y, {int} level);
function shopSpawnItemPowerup(_idx, _x, _y, _level)
{
	var _shopItem = noone;
	switch (_idx)
	{
		case Powerup.SHIELD:
			_shopItem = oShopItemShield;
			break;
		case Powerup.AIR_JUMP:
			_shopItem = oShopItemAirJump;
			break;
		case Powerup.INVINCIBLE:
			_shopItem = oShopItemInvincible;
			break;
		case Powerup.BALL:
			_shopItem = oShopItemBall;
			break;
		case Powerup.IRON_GRAPH:
			_shopItem = oShopItemIronGraph;
			break;
		case Powerup.BLOCK:
			_shopItem = oShopItemBlock;
			break;
		default:
			_shopItem = oShopItemCoin;
	}
	instance_create_layer(_x, _y, "Instances", _shopItem);
}

/// @func	shopSpawnItemUpgrade({int} idx, {real} x, {real} y, {int} level);
function shopSpawnItemUpgrade(_idx, _x, _y, _level)
{
	var _shopItem = noone;
	switch (_idx)
	{
		case Upgrade.EQUATION_UP:
			_shopItem = oShopItemEquationUp;
			break;
		default:
			_shopItem = oShopItemCoin;
	}
	instance_create_layer(_x, _y, "Instances", _shopItem);
}

/// @func	shopSpawnItemMisc({int} idx, {real} x, {real} y, {int} level);
function shopSpawnItemMisc(_idx, _x, _y, _level)
{
	var _shopItem = noone;
	switch (_idx)
	{
		case Misc.DEBUG_MODE:
			_shopItem = oShopItemDebug;
			break;
		default:
			_shopItem = oShopItemCoin;
	}
	instance_create_layer(_x, _y, "Instances", _shopItem);
}

/// @func	shopSpawnItemTheme({int} idx, {real} x, {real} y, {int} level);
function shopSpawnItemTheme(_idx, _x, _y, _level)
{
	var _shopItem = noone;
	switch (_idx)
	{
		case Theme.DAY:
			_shopItem = oShopItemDay;
			break;
		case Theme.BASIC:
			_shopItem = oShopItemBasic;
			break;
		case Theme.AQUA:
			_shopItem = oShopItemAqua;
			break;
		case Theme.GREEN:
			_shopItem = oShopItemGreen;
			break;
		case Theme.ALT_DEFAULT:
			_shopItem = oShopItemAltDefault;
			break;
		case Theme.TI_83:
			_shopItem = oShopItem83;
			break;
		default:
			_shopItem = oShopItemCoin;
	}
	instance_create_layer(_x, _y, "Instances", _shopItem);
}

/// @func	shopSpawnItemCharacter({int} idx, {real} x, {real} y, {int} level);
function shopSpawnItemCharacter(_idx, _x, _y, _level)
{
	var _shopItem = noone;
	switch (_idx)
	{
		case Character.DOG:
			_shopItem = oShopItemDog;
			break;
		case Character.SLIME:
			_shopItem = oShopItemSlime;
			break;
		default:
			_shopItem = oShopItemCoin;
	}
	instance_create_layer(_x, _y, "Instances", _shopItem);
}
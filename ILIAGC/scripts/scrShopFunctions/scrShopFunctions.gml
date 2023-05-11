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
		default:
			_shopItem = oShopItemCoin;
	}
	instance_create_layer(_x, _y, "Instances", _shopItem);
}
/// @func	getModeName({int} idx);
function getModeName(_idx)
{
	switch (_idx)
	{
		case Mode.COIN_RUSH:
			return "Coin Rush";
		case Mode.SOCCER:
			return "Soccer";
		default:
			return "???";
	}
}

/// @func	getModeSaveName({int} idx);
function getModeSaveName(_idx)
{
	switch (_idx)
	{
		case Mode.SOCCER:
			return "soccer";
		default:
			return "coin_rush";
	}
}

/// @func	getModeDescription({int} idx);
function getModeDescription(_idx)
{
	switch (_idx)
	{
		case Mode.COIN_RUSH:
			return "Mode: Collect as many coins as possible while trying to make sure the timer doesn't run out!";
		case Mode.SOCCER:
			return "Mode: Similar to Coin Rush but the only way to collect coins is with balls. Start with a special ball.";
		default:
			return "Mode: ???";
	}
}

/// @func	getModeSprite({int} idx);
function getModeSprite(_idx)
{
	switch (_idx)
	{
		case Mode.COIN_RUSH:
			return sCoinOutline;
		case Mode.SOCCER:
			return sShopItemSoccer;
		default:
			return sCoinOutline;
	}
}

/// @func	getModeCost({int} idx);
function getModeCost(_idx)
{
	switch (_idx)
	{
		case Mode.SOCCER:
			return 100;
		default:
			return 0;
	}
}
/// @func	getModeName({int} idx);
function getModeName(_idx)
{
	switch (_idx)
	{
		case Mode.SOCCER:
			return "Soccer";
		default:
			return "???";
	}
}

/// @func	getModeDescription({int} idx);
function getModeDescription(_idx)
{
	switch (_idx)
	{
		case Mode.SOCCER:
			return "Mode: GOOOOOOOOOOOOOAAAAAAAAAAAALL...";
		default:
			return "Mode: ???";
	}
}

/// @func	getModeSprite({int} idx);
function getModeSprite(_idx)
{
	switch (_idx)
	{
		case Mode.SOCCER:
			return sShopItemEquationUp;
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
			return 0;
		default:
			return 0;
	}
}
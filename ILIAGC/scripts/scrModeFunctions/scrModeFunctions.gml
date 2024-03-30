/// @func	getModeHighscore({int} idx);
function getModeHighscore(_idx)
{
	switch (_idx)
	{
		case Mode.COIN_RUSH:
			return oWorld.coinRushMostCoins;
		case Mode.SOCCER:
			return oWorld.soccerMostCoins;
		case Mode.PUZZLE:
			return oWorld.puzzleMostCoins;
		default:
			return 0;
	}
}

/// @func	getModeName({int} idx);
function getModeName(_idx)
{
	switch (_idx)
	{
		case Mode.COIN_RUSH:
			return "Coin Rush";
		case Mode.SOCCER:
			return "Soccer";
		case Mode.PUZZLE:
			return "Puzzle";
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
		case Mode.PUZZLE:
			return "puzzle";
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
		case Mode.PUZZLE:
			return "Mode: Collect coins, but graph eaters will always be present. Their pattern will change every so often.";
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
		case Mode.PUZZLE:
			return sGraphEater;
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
			return 300;
		case Mode.PUZZLE:
			return 200;
		default:
			return 0;
	}
}
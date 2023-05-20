/// @func	setUpgrade({int} idx);
function setUpgrade(_idx)
{
	switch (_idx)
	{
		case Upgrade.EQUATION_UP:
			array_push(oGrapher.graphs, [[], noone, 0, false]);
			break;
	}
}

/// @func	unsetUpgrade({int} idx);
function unsetUpgrade(_idx)
{
	switch (_idx)
	{
		case Upgrade.EQUATION_UP:
			with (oGrapher)
			{
				
				if (graphIdx == (array_length(graphs) - 1))
				{
					destroyGraph();
					equationTokens = [];
					graphIdx--;
				}
				array_pop(oGrapher.graphs);
			}
			break;
	}
}

/// @func	getUpgradeName({int} idx);
function getUpgradeName(_idx)
{
	switch (_idx)
	{
		case Upgrade.EQUATION_UP:
			return "Equation Up";
		default:
			return "???";
	}
}

/// @func	getUpgradeDescription({int} idx);
function getUpgradeDescription(_idx)
{
	switch (_idx)
	{
		case Upgrade.EQUATION_UP:
			return "Upgrade: Allows you to simultaneously graph 3 different equations.";
		default:
			return "Upgrade: ???";
	}
}

/// @func	getUpgradeSprite({int} idx);
function getUpgradeSprite(_idx)
{
	switch (_idx)
	{
		case Upgrade.EQUATION_UP:
			return sShopItemEquationUp;
		default:
			return sCoinOutline;
	}
}

/// @func	getUpgradeCost({int} idx);
function getUpgradeCost(_idx)
{
	switch (_idx)
	{
		case Upgrade.EQUATION_UP:
			return 999;
		default:
			return 0;
	}
}
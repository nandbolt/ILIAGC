/// @func	eatFood({int} idx);
function eatFood(_idx)
{
	switch (_idx)
	{
		case Food.SPAGHETTI:
			instance_create_layer(x, y, "Instances", oBall);
			break;
		case Food.CHOCOLATE:
			oPlayer.blocks = 1;
			break;
		default:
			oPlayer.shield = 1;
	}
}

/// @func	getFoodName({int} idx);
function getFoodName(_idx)
{
	switch (_idx)
	{
		case Food.SPAGHETTI:
			return "Spaghetti";
		case Food.CHOCOLATE:
			return "Chocolate";
		default:
			return "Bubble Tea";
	}
}

/// @func	getFoodSprite({int} idx);
function getFoodSprite(_idx)
{
	switch (_idx)
	{
		case Food.SPAGHETTI:
			return sFoodSpaghetti;
		case Food.CHOCOLATE:
			return sFoodChocolate;
		default:
			return sFoodBubbleTea;
	}
}

/// @func	getFoodCost({int} idx);
function getFoodCost(_idx)
{
	switch (_idx)
	{
		case Food.SPAGHETTI:
			return 0;
		case Food.CHOCOLATE:
			return 0;
		default:
			return 0;
	}
}
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

/// @func	getFoodDescription({int} idx);
function getFoodDescription(_idx)
{
	switch (_idx)
	{
		case Food.SPAGHETTI:
			return "Food: Start your next run with a ball, a meaty one!";
		case Food.CHOCOLATE:
			return "Food: Start with a block next run. It's 100% cacao, so I'm not sure if you want to eat it...";
		default:
			return "Food: Start with a bubble next run. What did you expect!?";
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
		case Food.BUBBLE_TEA:
			return 45;
		case Food.SPAGHETTI:
			return 30;
		case Food.CHOCOLATE:
			return 15;
		default:
			return 0;
	}
}
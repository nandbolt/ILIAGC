// Inherit the parent event
event_inherited();

// Text
description = "Equation Up";
price = 999;

/// @func	onCollect();
onCollect = function()
{
	array_push(oGrapher.graphs, [[], noone, 0, false]);
	oGame.myUpgrades[Upgrade.EQUATION_UP][1]++;
}
// Inherit the parent event
event_inherited();

// Text
description = "Iron Graph";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	array_push(oWorld.powerups, oPowerupIronGraph);
	oGame.myPowerups[Powerup.IRON_GRAPH][1]++;
}
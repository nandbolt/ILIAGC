// Inherit the parent event
event_inherited();

// Text
description = "Block";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	array_push(oWorld.powerups, oPowerupBlock);
	oGame.myPowerups[Powerup.BLOCK][1]++;
}
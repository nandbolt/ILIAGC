// Inherit the parent event
event_inherited();

// Text
description = "Shield";
price = 10;

/// @func	onCollect();
onCollect = function()
{
	array_push(oWorld.powerups, oPowerupBall);
	oGame.myPowerups[Powerup.SHIELD][1]++;
}
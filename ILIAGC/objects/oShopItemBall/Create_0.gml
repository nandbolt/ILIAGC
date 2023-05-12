// Inherit the parent event
event_inherited();

// Text
description = "Ball";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	array_push(oWorld.powerups, oPowerupBall);
	oGame.myPowerups[Powerup.BALL][1]++;
}
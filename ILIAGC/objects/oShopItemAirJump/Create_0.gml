// Inherit the parent event
event_inherited();

// Text
description = "Air Jump";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	array_push(oWorld.powerups, oPowerupAirJump);
	oGame.myPowerups[Powerup.AIR_JUMP][1]++;
}
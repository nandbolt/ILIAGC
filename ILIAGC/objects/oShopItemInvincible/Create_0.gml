// Inherit the parent event
event_inherited();

// Text
description = "Invincible";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	array_push(oWorld.powerups, oPowerupInvincible);
	oGame.myPowerups[Powerup.INVINCIBLE][1]++;
}
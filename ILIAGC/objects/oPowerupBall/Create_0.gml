// Inherit the parent event
event_inherited();

// Particles
particleColor = c_lime;

/// @func	onCollect();
onCollect = function()
{
	// Spawn ball
	instance_create_layer(x, y, "Instances", oBall);
	if (oGame.myPowerups[Powerup.BALL][1] > 2) instance_create_layer(x, y, "Instances", oBallGhost);
}
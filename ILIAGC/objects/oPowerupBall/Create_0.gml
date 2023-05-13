// Inherit the parent event
event_inherited();

// Particles
particleColor = c_lime;

/// @func	onCollect();
onCollect = function()
{
	// Spawn ball
	instance_create_layer(x, y, "Instances", oBall);
}
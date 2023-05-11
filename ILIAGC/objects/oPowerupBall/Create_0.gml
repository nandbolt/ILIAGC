// Inherit the parent event
event_inherited();

/// @func	onCollect();
onCollect = function()
{
	// Spawn ball
	instance_create_layer(x, y, "Instances", oBall);
}
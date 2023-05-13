// Inherit the parent event
event_inherited();

// Particles
particleColor = c_aqua;

/// @func	onCollect();
onCollect = function()
{
	// Set player shield
	oPlayer.shield = 1;
}
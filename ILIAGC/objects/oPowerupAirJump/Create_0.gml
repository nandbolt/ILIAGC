// Inherit the parent event
event_inherited();

// Particles
particleColor = c_yellow;

/// @func	onCollect();
onCollect = function()
{
	// Set player air jumps
	with (oPlayer)
	{
		canAirJump = true;
		airJumps = 1;
		airJumpTimer = 1200;
	}
}
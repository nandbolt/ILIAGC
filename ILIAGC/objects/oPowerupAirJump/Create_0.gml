// Inherit the parent event
event_inherited();

/// @func	onCollect();
onCollect = function()
{
	// Set player air jumps
	with (oPlayer)
	{
		canAirJump = true;
		airJumps = 1;
		airJumpTimer = 180;
	}
}
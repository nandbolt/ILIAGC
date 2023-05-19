// Inherit the parent event
event_inherited();

// Token
tokenIdx = 0;
tokenXOffset = HALF_TILE_SIZE;
tokenYOffset = HALF_TILE_SIZE;

/// @func	onPressed();
onPressed = function()
{
	// Add token to equation
	with (oGrapher)
	{
		addEquationToken(other.tokenIdx);
	}
}
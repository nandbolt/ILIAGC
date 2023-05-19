// Inherit the parent event
event_inherited();

// Token
tokenIdx = TokenIndexs.ENTER;

// Add neighbors
neighbors[InputAction.LEFT] = oOSKButtonPlus;
neighbors[InputAction.RIGHT] = oOSKButtonPi;
neighbors[InputAction.UP] = oOSKButtonBackspace;
neighbors[InputAction.DOWN] = oOSKButtonOpenParenthesis;

/// @func	onPressed();
onPressed = function()
{
	// Add token to equation
	with (oGrapher)
	{
		graphEquation();
	}
}
// Inherit the parent event
event_inherited();

// Token
tokenIdx = TokenIndexs.BACKSPACE;

// Add neighbors
neighbors[InputAction.LEFT] = oOSKButtonMinus;
neighbors[InputAction.RIGHT] = oOSKButtonTan;
neighbors[InputAction.UP] = oOSKButtonCloseParenthesis;
neighbors[InputAction.DOWN] = oOSKButtonEnter;

/// @func	onPressed();
onPressed = function()
{
	// Add token to equation
	with (oGrapher)
	{
		removeEquationToken();
	}
}
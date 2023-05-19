// Inherit the parent event
event_inherited();

// Token
tokenIdx = TokenIndexs.OPEN_PARENTHESIS;

// Add neighbors
neighbors[InputAction.LEFT] = oOSKButtonSlash;
neighbors[InputAction.RIGHT] = oOSKButtonSin;
neighbors[InputAction.UP] = oOSKButtonEnter;
neighbors[InputAction.DOWN] = oOSKButtonCloseParenthesis;
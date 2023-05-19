// Inherit the parent event
event_inherited();

// Token
tokenIdx = TokenIndexs.CLOSE_PARENTHESIS;

// Add neighbors
neighbors[InputAction.LEFT] = oOSKButtonAsterisk;
neighbors[InputAction.RIGHT] = oOSKButtonCos;
neighbors[InputAction.UP] = oOSKButtonOpenParenthesis;
neighbors[InputAction.DOWN] = oOSKButtonBackspace;
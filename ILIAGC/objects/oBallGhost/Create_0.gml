// Inherit the parent event
event_inherited();

// Lifetime
lifeTime = 1800;

// Sprite
ballSprite = sBallGhost;

// Graphs
ignoreGraphs = true;

// Gravity
gravityStrength = 0.03;

/// @func	resetKick();
resetKick = function()
{
	rotationSpeed = lerp(rotationSpeed, 0, 0.05);
}
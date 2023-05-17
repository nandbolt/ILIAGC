// Inherit the parent event
event_inherited();

// Particles
particleColor = c_red;

/// @func	onCollect();
onCollect = function()
{
	// Set iron graphs
	oGrapher.ironGraphs = oGame.myPowerups[Powerup.IRON_GRAPH][1];
}
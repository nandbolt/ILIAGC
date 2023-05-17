// Inherit the parent event
event_inherited();

// Particles
particleColor = c_olive;

// Blocks
maxBlocks = oGame.myPowerups[Powerup.BLOCK][1] * 2;
blocksOnPickup = oGame.myPowerups[Powerup.BLOCK][1];

/// @func	onCollect();
onCollect = function()
{
	// Set player blocks
	oPlayer.blocks = clamp(oPlayer.blocks + blocksOnPickup, 0, maxBlocks);
}
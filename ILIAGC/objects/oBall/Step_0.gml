// Update ground state
rbUpdateGroundState();

// Resistances
rbHandleResistances();

// Gravity
rbApplyGravity();

// Graph collisions
rbHandleGraphCollisions();

// X Tile Collisions
rbHandleXTileCollisions();

// Y Tile Collisions
rbHandleYTileCollisions();

// If game started and timer not paused
if (oWorld.gameStarted && !oWorld.gameTimerPaused)
{
	if (lifeTime <= 0) instance_destroy();
	else lifeTime--;
}
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

// Angular speed
imageAngle += rotationSpeed;

// If game started and timer not paused
if (!oWorld.gameTimerPaused)
{
	// Kick timer
	if (kickTimer > 0) kickTimer--;
	else resetKick();
	
	// Lifetimer
	if (lifeTime <= 0) instance_destroy();
	else lifeTime--;
}
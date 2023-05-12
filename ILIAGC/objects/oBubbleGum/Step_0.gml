// Inherit the parent event
event_inherited();

// Bob
bobTimer += bobTimerSpeed;
velocity.y = maxBobSpeed * sin(bobTimer);

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
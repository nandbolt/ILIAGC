// Movement vectors
xInput = 0;
velocity = new Vector2();

// Movement scalars
runStrength = 0.2;
driftStrength = 0.05;

// Jumping
jumpInputted = false;
jumpStrength = 3;

// Gravity
gravityStrength = 0.1;

// Resistances
airResistance = new Vector2();
airConstant = 0.002;
groundResistance = new Vector2();
groundConstant = 0.15;

// States
grounded = false;

// Tilemaps
collisionTiles = layer_tilemap_get_id("CollisionTiles");
collisionThreshold = 0.1;
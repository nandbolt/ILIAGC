// Movement vectors
xInput = 0;
velocity = new Vector2();

// Movement scalars
runStrength = 0.1;

// Jumping
jumpInputted = false;
jumpStrength = 3;

// Gravity
gravityStrength = 0.1;

// Air resistance
airResistance = new Vector2();
airFrictionConstant = 0.002;

// Tilemaps
collisionTiles = layer_tilemap_get_id("CollisionTiles");
collisionThreshold = 0.1;
// Lifetime
lifeTimer = 1800;

// Collisions
collisionTiles = layer_tilemap_get_id("CollisionTiles");

// Set tile
tilemap_set_at_pixel(collisionTiles, 1, x, y);
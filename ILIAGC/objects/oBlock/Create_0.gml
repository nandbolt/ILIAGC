// Lifetime
lifeTimer = 3600;

// Collisions
collisionTiles = layer_tilemap_get_id("CollisionTiles");

// Set tile
tilemap_set_at_pixel(collisionTiles, 1, x, y);

// State
vault = false;
if (oGame.myPowerups[Powerup.BLOCK][1] > 2) vault = true;

// Theme
if (oWorld.currentTheme == Theme.NEOKYO_CITY) sprite_index = sNeokyoCityPowerBox;
else if (oWorld.currentTheme == Theme.NNE) sprite_index = sNNEBox;
// Clear tile
tilemap_set_at_pixel(collisionTiles, 0, x, y);

// Particles
with (oParticles)
{
	part_particles_create(partSystem, other.x, other.y, partTypeDust, 2);
}
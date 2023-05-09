// If not collected
if (!collected)
{
	// Obliterate particles
	with (oParticles)
	{
		part_particles_create(partSystem, other.x, other.y, partTypeDust, 2);
	}
}
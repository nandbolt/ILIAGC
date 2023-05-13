// Inherit the parent event
event_inherited();

// If not collected
if (!collected)
{
	// Pulse particles
	if (particleTimer <= 0)
	{
		var _x = x + random_range(-4,4), _y = y + random_range(-4,4);
		with (oParticles)
		{
			part_particles_create_color(lowPartSystem, _x, _y, partTypeDust, other.particleColor, 1);
		}
	
		// Reset timer
		particleTimer = stepsBetweenParticles;
	}
	else particleTimer--;
}
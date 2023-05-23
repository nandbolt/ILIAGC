// If not collected
if (!collected)
{
	// Pulse particles
	if (pulseParticleTimer <= 0)
	{
		with (oParticles)
		{
			part_particles_create_color(lowPartSystem, other.x, other.y, partTypePulse, other.particleColor, 1);
		}
	
		// Reset timer
		pulseParticleTimer = stepsBetweenPulseParticles;
	}
	else pulseParticleTimer--;
}

// Inherit the parent event
event_inherited();
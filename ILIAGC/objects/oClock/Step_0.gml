// If not collected
if (!collected)
{
	// Pulse particles
	if (pulseParticleTimer <= 0)
	{
		with (oParticles)
		{
			part_particles_create(lowPartSystem, other.x, other.y, partTypePulse, 1);
		}
	
		// Reset timer
		pulseParticleTimer = stepsBetweenPulseParticles;
	}
	else pulseParticleTimer--;
}

// Inherit the parent event
event_inherited();
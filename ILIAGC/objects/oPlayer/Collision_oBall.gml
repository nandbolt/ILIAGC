// Change to ball scope
with (other)
{
	// If not kicked
	if (kickTimer == 0 && other.velocity.getLength() > 0.5)
	{		
		// Kick
		velocity.x = other.velocity.x * other.kickStrength;
		velocity.y = other.velocity.y * other.kickStrength;
		
		// Set kick timer
		kickTimer = kickTime;
		
		// Set rotation
		var _dir = 1;
		if (irandom(1) == 0) _dir = -1
		rotationSpeed = kickRotationSpeed * _dir;
		
		// Particles
		with (oParticles)
		{
			part_particles_create(partSystem, other.x, other.y, partTypeDust, 2);
		}
		
		// Set to ignore graphs if holding crouch
		if (other.jumpInputted) ignoreGraphs = true;
		
		// Sound
		audio_play_sound(landSound, 1, false);
	}
}
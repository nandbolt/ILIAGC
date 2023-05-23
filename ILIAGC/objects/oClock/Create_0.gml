// Inherit the parent event
event_inherited();

// Time
timeAdded = 30;

// Sound
collectSound = sfxPowerCollect;

// Particles
stepsBetweenPulseParticles = 60;
pulseParticleTimer = 0;
particleColor = c_white;

/// @func	onCollect();
onCollect = function()
{
	// Change to world scope
	with (oWorld)
	{
		// Update time
		gameTimer += other.timeAdded;
	}
	
	// Spawn time particle
	with (instance_create_layer(x, y - 6, "Instances", oTimeParticle))
	{
		value = "+" + string(other.timeAdded);
		image_blend = c_lime;
	}
	
	// Collect sound
	audio_play_sound(sfxPowerCollect, 1, false);
}
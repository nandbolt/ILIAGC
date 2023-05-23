// Inherit the parent event
event_inherited();

// Particles
particleColor = make_color_rgb(232, 185, 35);

/// @func	onCollect();
onCollect = function()
{
	// Change to world scope
	with (oWorld)
	{
		// Update time
		gameTimer = 60;
	}
	
	// Spawn time particle
	with (instance_create_layer(x, y - 6, "Instances", oTimeParticle))
	{
		value = "Time Reset";
		image_blend = other.particleColor;
	}
	
	// Collect sound
	audio_play_sound(sfxPowerCollect, 1, false);
}
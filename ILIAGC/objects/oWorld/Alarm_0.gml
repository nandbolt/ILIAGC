/// @desc End Game Buffer

// Spawn home coins if already showed coins collected
if (instance_exists(oDisplayCoinsCollected))
{
	// If got a highscore but highscore text hasn't appeared
	if (highscore && !instance_exists(oDisplayHighscore))
	{
		// Spawn highscore text and wait
		instance_create_layer(96, 32, "Instances", oDisplayHighscore);
		alarm[0] = 120;
		
		// New highscore sound
		audio_play_sound(sfxHighscore, 2, false);
	}
	else
	{
		// Spawn home coins
		spawnHomeCoins();
		
		// Sound
		audio_play_sound(sfxKeyPressed, 1, false);
	}
}
else
{
	// Spawn coins collected, wait
	instance_create_layer(72, 48, "Instances", oDisplayCoinsCollected);
	alarm[0] = 120;
	
	// Sound
	audio_play_sound(sfxKeyPressed, 1, false);
}
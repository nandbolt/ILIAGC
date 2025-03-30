// Load
loadText = "Loading music...";

// Font
draw_set_font(fDefault);

// Randomize
randomize();

// Particles
instance_create_layer(0,0,"Instances",oParticles);

// Game
instance_create_layer(0,0,"Instances",oGame);

// Input
instance_create_layer(0,0,"Instances",oInput);

// Audio
audio_group_load(audiogroup_music);

// GX Games + Coin Challenge
if (os_type == os_gxgames && global.currentChallenge == global.challengeIdCoinRush)
{
	// Create coin challenge object
	instance_create_layer(0, 0, "Instances", oGXChallengeCoinRush);
}
// Android
else if (os_type == os_android)
{
	// On-screen controller
	instance_create_layer(0, 0, "Instances", oOnScreenController);
}

// Start load alarm
alarm[0] = 180;
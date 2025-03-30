// Load
loadText = "Loading music...";
onCoolmath = true;

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

// Coolmath site locking
domain = url_get_domain();
if (domain != "https://www.coolmath-games.com" &&
	domain != "m.coolmathgames.com" &&
	domain != "dev.coolmathgames.com" &&
	domain != "edit-stage.coolmathgames.com" &&
	domain != "www.stage.coolmathgames.com" &&
	domain != "edit.coolmathgames.com" &&
	domain != "www.coolmathgames.com" &&
	domain != "https://www.coolmathgames.com" &&
	domain != "m.coolmath-games.com" &&
	domain != "dev.coolmath-games.com" &&
	domain != "edit-stage.coolmath-games.com" &&
	domain != "www.stage.coolmath-games.com" &&
	domain != "edit.coolmath-games.com" &&
	domain != "www.coolmath-games.com")
{
	// Not playing on cool math, prevent load
	onCoolmath = false;
	loadText = "This version of ILIAGC only runs on Coolmath Games!";
	alarm[0] = -1;
}
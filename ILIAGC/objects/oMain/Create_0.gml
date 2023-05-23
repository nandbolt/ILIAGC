// Font
draw_set_font(fDefault);

// Debug
//instance_create_layer(0,0,"Instances",oDebug);

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
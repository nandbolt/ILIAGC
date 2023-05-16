// Inherit parent
event_inherited();

// Damage
damage = 10;

// Theme
if (oWorld.currentTheme == Theme.NNE) sprite_index = sNNECrystal;

// Spawn sound
audio_play_sound(sfxSpikeSpawn, 1, false);
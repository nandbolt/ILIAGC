// Inherit parent
event_inherited();

// HP
hp = 10;
if (oWorld.gameMode == Mode.PUZZLE) hp = 1000;

// Theme
if (oWorld.currentTheme == Theme.NNE) sprite_index = sNNEPortal;

// Hum sound
if (!audio_is_playing(sfxGraphEaterHum)) audio_play_sound(sfxGraphEaterHum, 1, true);
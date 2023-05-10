// Inherit parent
event_inherited();

// HP
hp = 10;

// Hum sound
if (!audio_is_playing(sfxGraphEaterHum)) audio_play_sound(sfxGraphEaterHum, 1, true);
// Inherit the parent event
event_inherited();

// HP
hp = 5;

// Rain
rainTimer = 0;
rainFrequency = 30;

// Theme
if (oWorld.currentTheme == Theme.NEOKYO_CITY)
{
	sprite_index = sNeokyoCityDrone;
}

// Spawn sound
audio_play_sound(sfxCloudSpawn, 1, false);
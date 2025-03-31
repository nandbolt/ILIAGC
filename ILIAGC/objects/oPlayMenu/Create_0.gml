// Play
playPressed = false;
playButtonWidth = 150;
playButtonHeight = 25;
playButtonX = camera_get_view_width(view_camera[0]) * 0.5 - playButtonWidth * 0.5;
playButtonY = camera_get_view_height(view_camera[0]) * 0.5 - playButtonHeight * 0.5;

///	@func	pressPlay();
pressPlay = function()
{
	if (playPressed) return;
	alarm[0] = 30;
	playPressed = true;
	audio_play_sound(sfxToggleGrapher, 10, false);
	coolmathCallStart();
	coolmathCallLevelStart(0);
}

// Start alarm
alarm[0] = 30;
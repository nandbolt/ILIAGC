// Scale canvas if playing on browser
if (os_browser != browser_not_a_browser && (browser_width != canvasWidth || browser_height != canvasHeight))
{
	// Scale canvas
	canvasWidth = min(CANVAS_BASE_WIDTH, browser_width);
	canvasHeight = min(CANVAS_BASE_HEIGHT, browser_height);
	browserScaleCanvas(CANVAS_BASE_WIDTH, CANVAS_BASE_HEIGHT, canvasWidth, canvasHeight, true);
}

// Quit
if (getQuitInput()) game_end();
else if (keyboard_check_pressed(vk_f11)) window_set_fullscreen(!window_get_fullscreen());
#region Unlockables

// Item idx, current lvl, max lvl
myPowerups = [
	[Powerup.SHIELD,		1, 1],
	[Powerup.AIR_JUMP,		0, 1],
	[Powerup.INVINCIBLE,	0, 1],
	[Powerup.BALL,			0, 1],
	[Powerup.IRON_GRAPH,	0, 1],
	[Powerup.BLOCK,			0, 1],
];
myUpgrades = [
	[Upgrade.EQUATION_UP,	0, 1],
];
myMisc = [
	[Misc.DEBUG_MODE,		0, 1],
];
myTheme = [
	[Theme.DEFAULT,			1, 1],
	[Theme.DAY,				0, 1],
	[Theme.BASIC,			0, 1],
];

#endregion

// Canvas
canvasWidth = CANVAS_BASE_WIDTH;
canvasHeight = CANVAS_BASE_HEIGHT;

/// @func	browserScaleCanvas({int} baseWidth, {int} baseHeight, {int} currentWidth, {int} currentHeight, {bool} center);
browserScaleCanvas = function(_baseWidth, _baseHeight, _currentWidth, _currentHeight, _center)
{
	// Set window size
	var _aspect = _baseWidth / _baseHeight;
	if ((_currentWidth / _aspect) > _currentHeight) window_set_size(_currentHeight * _aspect, _currentHeight);
	else window_set_size(_currentWidth, _currentWidth / _aspect);
	if (_center) window_center();
	
	// Set viewport size
	view_set_wport(0, min(window_get_width(), _baseWidth));
	view_set_hport(0, min(window_get_height(), _baseHeight));
	
	// Resize surface
	surface_resize(application_surface, min(window_get_width(), _baseWidth), min(window_get_height(), _baseHeight));
}

/// @func	getQuitInput();
getQuitInput = function()
{
	return keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0,gp_select);
}
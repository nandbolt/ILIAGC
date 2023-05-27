// States
gamePaused = false;

// Canvas
canvasWidth = CANVAS_BASE_WIDTH;
canvasHeight = CANVAS_BASE_HEIGHT;

// Audio
musicGain = 0.5;
sfxGain = 0.5;

// UI
tidyUI = false;

/// @func	browserScaleCanvas({int} baseWidth, {int} baseHeight, {int} currentWidth, {int} currentHeight, {bool} center);
browserScaleCanvas = function(_baseWidth, _baseHeight, _currentWidth, _currentHeight, _center)
{
	// Set window size
	var _aspect = _baseWidth / _baseHeight;
	if ((_currentWidth / _aspect) > _currentHeight) window_set_size(_currentHeight * _aspect, _currentHeight);
	else window_set_size(_currentWidth, _currentWidth / _aspect);
	
	// Set center
	if (_center) window_center();
	
	// Set viewport size
	view_set_wport(0, min(window_get_width(), _baseWidth));
	view_set_hport(0, min(window_get_height(), _baseHeight));
	
	// Resize surface
	surface_resize(application_surface, min(window_get_width(), _baseWidth), min(window_get_height(), _baseHeight));
}

/// @func	pauseGame();
pauseGame = function()
{
	// Pause game state
	gamePaused = true;
	
	// Pause game timer
	oWorld.gameTimerPaused = true;
	
	// Init sprite
	var _spriteInstance = noone;
	
	#region Player
	
	with (oPlayer)
	{
		if (shield > 0)
		{
			_spriteInstance = instance_create_layer(x, y, "Instances", oPauseSprite);
			with (_spriteInstance)
			{
				sprite_index = sShield;
				image_angle = other.image_angle;
			}
		}
		_spriteInstance = instance_create_layer(x,y,"Instances",oPauseSprite);
		with (_spriteInstance)
		{
			// Setup player sprite placeholder
			sprite_index = other.sprite_index;
			image_index = other.image_index;
			image_xscale = other.image_xscale;
			image_blend = other.image_blend;
			image_angle = other.image_angle;
		}
	}
	instance_deactivate_object(oPlayer);
	
	#endregion
	
	#region Acid Rain
	
	if (instance_exists(oAcidRain))
	{
		// Go through each acid rain and make a sprite instance for them, then deactivate them all
		with (oAcidRain)
		{
			var _spriteInstance = instance_create_layer(x, y, "BackgroundInstances", oPauseSprite);
			with (_spriteInstance)
			{
				sprite_index = other.sprite_index;
				image_alpha = other.image_alpha;
			}
		}
		instance_deactivate_object(oAcidRain);
	}
	
	#endregion
		
	#region Ball
	
	if (instance_exists(oBall))
	{
		with (oBall)
		{
			var _spriteInstance = instance_create_layer(x, y - 6, "BackgroundInstances", oPauseSprite);
			with (_spriteInstance)
			{
				// Setup player sprite placeholder
				sprite_index = sBall;
				image_angle = other.imageAngle;
			}
		}
		instance_deactivate_object(oBall);
	}
	
	#endregion
		
	#region Bubble Gum
	
	if (instance_exists(oBubbleGum))
	{
		with (oBubbleGum)
		{
			var _spriteInstance = instance_create_layer(x, y, "BackgroundInstances", oPauseSprite);
			with (_spriteInstance)
			{
				sprite_index = other.sprite_index;
				image_alpha = other.image_alpha;
			}
		}
		instance_deactivate_object(oBubbleGum);
	}
	
	#endregion
	
	#region Spider
	
	if (instance_exists(oSpider))
	{
		with (oSpider)
		{
			var _spriteInstance = instance_create_layer(x, y, "BackgroundInstances", oPauseSprite);
			with (_spriteInstance)
			{
				sprite_index = other.sprite_index;
				image_alpha = other.image_alpha;
				image_angle = other.image_angle;
			}
		}
		instance_deactivate_object(oSpider);
	}
	
	#endregion
	
	// Pause sound
	audio_play_sound(sfxToggleGrapher, 2, false);
}

/// @func	resumeGame();
resumeGame = function()
{
	// Destroy all pause sprites
	instance_destroy(oPauseSprite);
	
	// Activate all objects
	instance_activate_all();
	
	// Resume sound
	audio_play_sound(sfxToggleGrapher, 2, false);
	
	// Resume game timer
	oWorld.gameTimerPaused = false;
	
	// Pause game state
	gamePaused = false;
}

/// @func	loadUnlockables();
loadUnlockables = function()
{
	// Open save
	ini_open("save.ini");

	// Item idx, current lvl, max lvl
	myPowerups = [
		[Powerup.SHIELD,		ini_read_real("powerups", getPowerupSaveName(Powerup.SHIELD), 1),		3],
		[Powerup.AIR_JUMP,		ini_read_real("powerups", getPowerupSaveName(Powerup.AIR_JUMP), 0),		3],
		[Powerup.INVINCIBLE,	ini_read_real("powerups", getPowerupSaveName(Powerup.INVINCIBLE), 0),	3],
		[Powerup.BALL,			ini_read_real("powerups", getPowerupSaveName(Powerup.BALL), 0),			3],
		[Powerup.IRON_GRAPH,	ini_read_real("powerups", getPowerupSaveName(Powerup.IRON_GRAPH), 0),	3],
		[Powerup.BLOCK,			ini_read_real("powerups", getPowerupSaveName(Powerup.BLOCK), 0),		3],
	];
	myUpgrades = [
		[Upgrade.EQUATION_UP,	ini_read_real("upgrades", getUpgradeSaveName(Upgrade.EQUATION_UP), 0),	1],
	];
	myMisc = [
		[Misc.DEBUG_MODE,		ini_read_real("misc", getMiscSaveName(Misc.DEBUG_MODE), 0),				1],
	];
	myTheme = [
		[Theme.DEFAULT,			ini_read_real("themes", getThemeSaveName(Theme.DEFAULT), 1),			1],
		[Theme.DAY,				ini_read_real("themes", getThemeSaveName(Theme.DAY), 0),				1],
		[Theme.BASIC,			ini_read_real("themes", getThemeSaveName(Theme.BASIC), 0),				1],
		[Theme.AQUA,			ini_read_real("themes", getThemeSaveName(Theme.AQUA), 0),				1],
		[Theme.GREEN,			ini_read_real("themes", getThemeSaveName(Theme.GREEN), 0),				1],
		[Theme.ALT_DEFAULT,		ini_read_real("themes", getThemeSaveName(Theme.ALT_DEFAULT), 0),		1],
		[Theme.TI_83,			ini_read_real("themes", getThemeSaveName(Theme.TI_83), 0),				1],
		[Theme.NEOKYO_CITY,		ini_read_real("themes", getThemeSaveName(Theme.NEOKYO_CITY), 0),		1],
		[Theme.NNE,				ini_read_real("themes", getThemeSaveName(Theme.NNE), 0),				1],
	];
	myCharacters = [
		[Character.HUMAN,		ini_read_real("characters", getCharacterSaveName(Character.HUMAN), 1),	1],
		[Character.DOG,			ini_read_real("characters", getCharacterSaveName(Character.DOG), 0),	1],
		[Character.SLIME,		ini_read_real("characters", getCharacterSaveName(Character.SLIME), 0),	1],
	];
	myModes = [
		[Mode.COIN_RUSH,		ini_read_real("modes", getModeSaveName(Mode.COIN_RUSH), 1),				1],
		[Mode.SOCCER,			ini_read_real("modes", getModeSaveName(Mode.SOCCER), 0),				1],
	];
	myFoods = [
		[Food.BUBBLE_TEA,		0, 1],
		[Food.SPAGHETTI,		0, 1],
		[Food.CHOCOLATE,		0, 1],
	];

	// Close save
	ini_close();
}

// Load unlockables
loadUnlockables();

// Set gain
audio_group_set_gain(audiogroup_default, sfxGain, 0);
audio_group_set_gain(audiogroup_music, musicGain, 0);
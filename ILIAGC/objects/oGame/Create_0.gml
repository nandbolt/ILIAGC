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
	[Theme.AQUA,			0, 1],
	[Theme.GREEN,			0, 1],
	[Theme.ALT_DEFAULT,		0, 1],
	[Theme.TI_83,			0, 1],
	[Theme.NEOKYO_CITY,		0, 1],
	[Theme.NNE,				0, 1],
];
myCharacters = [
	[Character.HUMAN,		1, 1],
	[Character.DOG,			0, 1],
	[Character.SLIME,		0, 1],
];
myModes = [
	[Mode.COIN_RUSH,		1, 1],
	[Mode.SOCCER,			0, 1],
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

/// @func	pauseGame();
pauseGame = function()
{
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
}

/// @func	resumeGame();
resumeGame = function()
{
	// Destroy all pause sprites
	instance_destroy(oPauseSprite);
	
	// Activate all objects
	instance_activate_all();
	
	// Resume game timer
	oWorld.gameTimerPaused = false;
}
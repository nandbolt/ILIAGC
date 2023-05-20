/// @func	setTheme({int} idx);
function setTheme(_idx)
{
	// Unset previous theme
	unsetTheme(oWorld.currentTheme);
	
	// Set theme
	switch (_idx)
	{
		case Theme.DAY:
			oWorld.currentShader = shdrDay;
			window_set_color(c_white);
			break;
		case Theme.BASIC:
			oWorld.currentShader = shdrContrast;
			break;
		case Theme.AQUA:
			oWorld.currentShader = shdrAqua;
			break;
		case Theme.GREEN:
			oWorld.currentShader = shdrGreen;
			break;
		case Theme.ALT_DEFAULT:
			oWorld.currentShader = shdrAltDefault;
			break;
		case Theme.TI_83:
			oWorld.currentShader = shdr83;
			window_set_color(make_color_rgb(144,155,99));
			break;
		case Theme.NEOKYO_CITY:
			// Player
			with (oPlayer)
			{
				updateTheme(Theme.NEOKYO_CITY);
			}
			
			// Background
			var _background = layer_background_get_id("Background");
			layer_background_blend(_background, c_black);
			layer_set_visible("NeokyoCity", true);
			layer_set_visible("GridNumberBackgrounds", true);
			layer_set_visible("GridAxis", false);
			break;
		case Theme.NNE:
			// Player
			with (oPlayer)
			{
				updateTheme(Theme.NNE);
			}
			
			// Background
			var _background = layer_background_get_id("Background");
			layer_background_sprite(_background, sNNESpace);
			layer_set_visible("NNE", true);
			layer_set_visible("GridNumberBackgrounds", true);
			layer_set_visible("GridAxis", false);
			break;
	}
	oWorld.currentTheme = _idx;
}

/// @func	unsetTheme({int} idx);
function unsetTheme(_idx)
{
	switch (_idx)
	{
		case Theme.DAY:
		case Theme.TI_83:
			window_set_color(c_black);
		case Theme.BASIC:
		case Theme.AQUA:
		case Theme.GREEN:
		case Theme.ALT_DEFAULT:
			oWorld.currentShader = shdrPass;
			break;
		case Theme.NEOKYO_CITY:
			// Player
			with (oPlayer)
			{
				updateTheme(Theme.DEFAULT);
			}
			
			// Background
			var _background = layer_background_get_id("Background");
			layer_background_blend(_background, c_white);
			layer_set_visible("NeokyoCity", false);
			layer_set_visible("GridNumberBackgrounds", false);
			layer_set_visible("GridAxis", true);
			break;
		case Theme.NNE:
			// Player
			with (oPlayer)
			{
				updateTheme(Theme.DEFAULT);
			}
			
			// Background
			var _background = layer_background_get_id("Background");
			layer_background_sprite(_background, sGrid);
			layer_set_visible("NNE", false);
			layer_set_visible("GridNumberBackgrounds", false);
			layer_set_visible("GridAxis", true);
			break;
	}
}

/// @func	getThemeName({int} idx);
function getThemeName(_idx)
{
	switch (_idx)
	{
		case Theme.DAY:
			return "Day";
		case Theme.BASIC:
			return "Basic";
		case Theme.AQUA:
			return "Aqua";
		case Theme.GREEN:
			return "Green";
		case Theme.ALT_DEFAULT:
			return "Alt Default";
		case Theme.TI_83:
			return "83";
		case Theme.NEOKYO_CITY:
			return "Neokyo City";
		case Theme.NNE:
			return "Nowhere Near Earth";
		default:
			return "Default";
	}
}

/// @func	getThemeDescription({int} idx);
function getThemeDescription(_idx)
{
	switch (_idx)
	{
		case Theme.DAY:
			return "Theme: It'll burn your eyes.";
		case Theme.BASIC:
			return "Theme: For those who enjoy the simple things.";
		case Theme.AQUA:
			return "Theme: Ah, I can almost smell the ocean.";
		case Theme.GREEN:
			return "Theme: If the system had a color, it would be green.";
		case Theme.ALT_DEFAULT:
			return "Theme: For those who really, really like purple coins.";
		case Theme.TI_83:
			return "Theme: The essence of older times.";
		case Theme.NEOKYO_CITY:
			return "Theme: In a city powered by the noble gases and overtaken by evil robots, one brave hero...";
		case Theme.NNE:
			return "Theme: The engine is fried! Oh, wait, I think I just crashed the ship. What planet is this...";
		default:
			return "Theme: ???";
	}
}

/// @func	getThemeSprite({int} idx);
function getThemeSprite(_idx)
{
	switch (_idx)
	{
		case Theme.DAY:
			return sThemeDay;
		case Theme.BASIC:
			return sThemeBasic;
		case Theme.AQUA:
			return sThemeAqua;
		case Theme.GREEN:
			return sThemeGreen;
		case Theme.ALT_DEFAULT:
			return sThemeAltDefault;
		case Theme.TI_83:
			return sTheme83;
		case Theme.NEOKYO_CITY:
			return sThemeNeokyoCity;
		case Theme.NNE:
			return sThemeNNE;
		default:
			return sThemeDefault;
	}
}

/// @func	getThemeCost({int} idx);
function getThemeCost(_idx)
{
	switch (_idx)
	{
		case Theme.DAY:
			return 10;
		case Theme.BASIC:
			return 25;
		case Theme.AQUA:
			return 50;
		case Theme.GREEN:
			return 75;
		case Theme.ALT_DEFAULT:
			return 40;
		case Theme.TI_83:
			return 83;
		case Theme.NEOKYO_CITY:
			return 100;
		case Theme.NNE:
			return 200;
		default:
			return 0;
	}
}
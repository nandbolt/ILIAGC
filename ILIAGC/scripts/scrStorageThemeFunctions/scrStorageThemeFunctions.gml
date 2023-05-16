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
			layer_background_sprite(_background, sNeokyoCityMountains);
			layer_background_vtiled(_background, false);
			layer_y(layer_get_id("Background"), 104);
			layer_set_visible("NeokyoCity", true);
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
			layer_background_sprite(_background, sGrid);
			layer_background_vtiled(_background, true);
			layer_y(layer_get_id("Background"), 0);
			layer_set_visible("NeokyoCity", false);
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
		default:
			return "Default";
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
			return 0;
		case Theme.BASIC:
			return 0;
		case Theme.AQUA:
			return 0;
		case Theme.GREEN:
			return 0;
		case Theme.ALT_DEFAULT:
			return 0;
		case Theme.TI_83:
			return 0;
		case Theme.NEOKYO_CITY:
			return 0;
		default:
			return 0;
	}
}
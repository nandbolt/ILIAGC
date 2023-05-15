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
	}
}
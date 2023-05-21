/// @func	setMisc({int} idx);
function setMisc(_idx)
{
	switch (_idx)
	{
		case Misc.DEBUG_MODE:
			if (!instance_exists(oDebug)) instance_create_layer(0,0,"Instances",oDebug);
			break;
	}
}

/// @func	unsetMisc({int} idx);
function unsetMisc(_idx)
{
	switch (_idx)
	{
		case Misc.DEBUG_MODE:
			if (instance_exists(oDebug)) instance_destroy(oDebug);
			break;
	}
}

/// @func	getMiscName({int} idx);
function getMiscName(_idx)
{
	switch (_idx)
	{
		case Misc.DEBUG_MODE:
			return "Debug Mode";
		default:
			return "???";
	}
}

/// @func	getMiscSaveName({int} idx);
function getMiscSaveName(_idx)
{
	switch (_idx)
	{
		case Misc.DEBUG_MODE:
			return "debug_mode";
		default:
			return "???";
	}
}

/// @func	getMiscDescription({int} idx);
function getMiscDescription(_idx)
{
	switch (_idx)
	{
		case Misc.DEBUG_MODE:
			return "Misc: Allows you to see hitboxes and junk.";
		default:
			return "Misc: ???";
	}
}

/// @func	getMiscSprite({int} idx);
function getMiscSprite(_idx)
{
	switch (_idx)
	{
		case Misc.DEBUG_MODE:
			return sShopItemDebugMode;
		default:
			return sCoinOutline;
	}
}

/// @func	getMiscCost({int} idx);
function getMiscCost(_idx)
{
	switch (_idx)
	{
		case Misc.DEBUG_MODE:
			return 100;
		default:
			return 0;
	}
}
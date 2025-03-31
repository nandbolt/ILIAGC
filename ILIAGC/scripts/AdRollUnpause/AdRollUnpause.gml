/// @func	AdRollUnpause();
function AdRollUnpause()
{
	if (instance_exists(oCMG))
	{
		with (oCMG)
		{
			instance_activate_all();
		}
	}
}
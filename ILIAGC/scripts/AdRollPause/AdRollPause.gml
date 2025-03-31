/// @func	AdRollPause();
function AdRollPause()
{
	if (instance_exists(oCMG))
	{
		with (oCMG)
		{
			instance_deactivate_all(true);
		}
	}
}
/// @desc Music Loaded
if (async_load[? "type"] == "audiogroup_load" && async_load[? "group_id"] == audiogroup_music)
{
	// Start game
	alarm[0] = 30;
	loadText = "Music loaded!";
}
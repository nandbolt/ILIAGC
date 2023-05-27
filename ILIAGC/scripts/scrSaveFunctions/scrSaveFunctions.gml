/// @func	resetSave();
function resetSave()
{
	// Delete save file
	file_delete("save.ini");
	
	// Close game
	game_end();
}
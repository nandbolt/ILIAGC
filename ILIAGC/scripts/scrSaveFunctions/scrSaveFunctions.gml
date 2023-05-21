/// @func	resetSave();
function resetSave()
{
	// Open save
	ini_open("save.ini");
	
	// Delete unlockables
	ini_section_delete("powerups");
	ini_section_delete("upgrades");
	ini_section_delete("misc");
	ini_section_delete("themes");
	ini_section_delete("characters");
	ini_section_delete("modes");
	
	// Delete high scores
	ini_section_delete("high_scores");
	
	// Delete inventory
	ini_section_delete("inventory");
	
	// Close save
	ini_close();
}
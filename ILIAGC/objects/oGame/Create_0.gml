/// @func	getQuitInput();
getQuitInput = function()
{
	return keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0,gp_select);
}
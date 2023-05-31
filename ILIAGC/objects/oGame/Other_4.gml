// Resize GUI
if (os_type == os_android)
{
	view_wport[0] = CANVAS_BASE_WIDTH / 5;
	view_hport[0] = CANVAS_BASE_HEIGHT / 5 + 96;
	camera_set_view_size(view_camera[0], view_wport[0], view_hport[0]);
	surface_resize(application_surface, view_wport[0] * 5, view_hport[0] * 5);
	window_set_size(view_wport[0] * 5, view_hport[0] * 5);
}
display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
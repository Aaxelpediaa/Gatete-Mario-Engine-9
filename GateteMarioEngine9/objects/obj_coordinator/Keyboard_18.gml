/// @description Restart the game when both ALT+R are pressed

if (keyboard_check_pressed(ord("R"))) {

	//Stop playing all sounds
	audio_stop_all();
	
	//Reset global variables
	init_globals();
	
	//Go to the title screen
	if (instance_number(obj_curtain_out) == 0) {
	
		with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, -99, obj_curtain_out))
			target = rm_init;
	}
}
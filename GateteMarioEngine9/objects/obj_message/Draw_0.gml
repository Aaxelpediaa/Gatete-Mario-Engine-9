/// @description Draw the text and the message box

//If the sprite exists
if (sprite_exists(snapshot)) {
	
	//Draw the sprite
	draw_sprite_ext(snapshot, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1 / obj_coordinator.size, 1 / obj_coordinator.size, 0, c_white, 1);
}

//Draw the message box
draw_sprite_ext(spr_gui_global_message, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + 68, scale, scale, 0, c_white, 0.9);

//If the text is being displayed
if (showing == 1) {

    //Increment the number of letters that should be displayed
    if (a <= string_length(text)) {
		
        a++;
	}
	
	//Set the font
	draw_set_font(global.gui_font);
	
	//Draw the text
	draw_text_shadowed(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - 96, camera_get_view_y(view_camera[0]) + 40, string_hash_to_newline(string_copy(text, 1, a)), c_black, c_white, 1, 1, 0.5, 1);
}
/// @description Drop the reserve item

with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + 8, -12, obj_reserveitem)) {

	//Set the sprite for the powerup
	sprite_index = macro_get_sprite(global.reserve);
}

//Reset reserve item
global.reserve = cs_small;
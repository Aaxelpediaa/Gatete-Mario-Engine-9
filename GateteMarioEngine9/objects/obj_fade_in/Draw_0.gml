/// @description Draw the effect

//If the sprite exists
if (surface_exists(snapshot)) {
	
	//Draw the surface
	draw_surface_ext(snapshot, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1 / obj_coordinator.size, 1 / obj_coordinator.size, 0, c_white, 1);
}

//Set the alpha
draw_set_alpha(alpha);

//Draw screen mask
draw_rectangle_colour(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 5000, 5000, c_black, c_black, c_black, c_black, 0);

//Reset alpha
draw_set_alpha(1);
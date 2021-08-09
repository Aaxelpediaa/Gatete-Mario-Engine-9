/// @description Draw Mario

//If the sprite exists
if (sprite_exists(snapshot)) {
	
	//Draw the sprite
	draw_sprite_ext(snapshot, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 0.5, 0.5, 0, c_white, 1);
}

//Draw Mario
draw_sprite_ext(sprite_index, -1, round(x), round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
/// @description Draw Mario

//If the sprite exists
if (sprite_exists(snapshot)) {
	
	//Draw the sprite
	draw_sprite_ext(snapshot, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1 / obj_coordinator.size, 1 / obj_coordinator.size, 0, c_white, 1);
}

//Draw Mario
if (sequence < 5)
	draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, direct, image_yscale, 0, c_white, image_alpha);
else
	draw_sprite_custom_origin(sprite_index, -1, screen_round(x), screen_round(y)+1, 16, 32, scale*direct, scale, 0, c_white, image_alpha);
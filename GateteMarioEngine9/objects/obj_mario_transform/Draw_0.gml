/// @description Draw the player

//Draw the surface
if (sprite_exists(sprite)) {

	//Disable alpha blending
	gpu_set_blendenable(0);
	
	//Draw the sprite
	draw_sprite(sprite, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
	
	//Enable alpha blending
	gpu_set_blendenable(1);
}

//Draw Mario
draw_sprite_ext(sprite_index, -1, round(x), round(y)+1, image_xscale, 1, 0, c_white, image_alpha);
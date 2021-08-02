/// @description Draws the screenshot shown when fading to black

//If the sprite exists
if (sprite_exists(back)) {

	//Disable alpha blending
    gpu_set_blendenable(false);
	
	//Draw the sprite
    draw_sprite_ext(back, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1, 1, 0, c_white, 1);
    
	//Enable alpha blending
	gpu_set_blendenable(true);
}
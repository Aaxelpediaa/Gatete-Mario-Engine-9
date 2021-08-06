/// @description Draw effect

//Set blend mode
gpu_set_blendmode(bm_add);

//Draw the sprite
draw_sprite_ext(sprite_index, 0, x, y, scale, scale, 0, image_blend, alpha);

//Reset blend mode
gpu_set_blendmode(bm_normal);
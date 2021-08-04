/// @description Draw ring

//Set blend mode
gpu_set_blendmode(bm_add);

//Draw effect
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, make_colour_rgb(252, 224, 25), alpha);

//Reset blend mode
gpu_set_blendmode(bm_normal);
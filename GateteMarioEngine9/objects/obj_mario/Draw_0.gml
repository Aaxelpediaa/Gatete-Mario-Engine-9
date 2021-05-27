/// @description Draw Mario

//Set up the palette
pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);

//Draw Mario
draw_sprite_custom_origin(sprite_index, image_index, round(x), round(y)+1, sprite_get_xoffset(sprite_index), sprite_height, xscale, yscale, 0, image_blend, image_alpha);

//Reset the palette
pal_swap_reset();
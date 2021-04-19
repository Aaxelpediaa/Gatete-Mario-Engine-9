/// @description Draw The Player

pal_swap_set_player(spr_palette_mario,spr_palette_mario_invincible);

draw_sprite_custom_origin(sprite_index,image_index,round(x),round(y),sprite_get_xoffset(sprite_index),sprite_height,xscale,yscale,0,image_blend,image_alpha);

pal_swap_reset();
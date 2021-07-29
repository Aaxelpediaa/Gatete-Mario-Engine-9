/// @description Draw Mario

if (fly != noone)

	return;

//Set up the palette
pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);

//Draw Mario
if (sprite_index > -1) {
	
	switch (global.powerup) {
	
		//Tiny
		case (cs_tiny): {
		
			draw_sprite_custom_origin(sprite_index, image_index, x, y+1, sprite_get_xoffset(sprite_index), 16, 0.5*xscale, 0.5*yscale, 0, image_blend, image_alpha);
		} break;
		
		//Mega
		case (cs_mega): {
			
			draw_sprite_custom_origin(sprite_index, image_index, x, y+1, sprite_get_xoffset(sprite_index), sprite_height, 3*xscale, 3*yscale, 0, image_blend, image_alpha);
		} break;
	
		//Rest of sprites
		default:
			draw_sprite_custom_origin(sprite_index, image_index, x, y+1, sprite_get_xoffset(sprite_index), sprite_height, xscale, yscale, 0, image_blend, image_alpha);
	}
}

//Reset the palette
pal_swap_reset();
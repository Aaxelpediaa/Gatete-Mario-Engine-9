/// @description Draw NPC
//draw_sprite_custom_origin(sprite_index, image_index, round(x), round(y)+1, sprite_get_xoffset(sprite_index), sprite_height, xscale, yscale, 0, image_blend, image_alpha);
draw_self();
draw_text(x,y-20,string(bounces));
draw_text(x,y-20,string(yspeed));
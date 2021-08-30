/// @description Draw Note Block

//If there's an item inside
if (sprout != cs_coin)
	draw_sprite_ext(spr_noteblock_item, -1, x, y, 1, 1, 0, c_white, 1);
else
	draw_sprite_ext(sprite_index, -1, x, y, 1, 1, 0, c_white, 1);
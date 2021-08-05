/// @description Draw the pipe

if (broken == 0)
	draw_sprite_ext(sprite_index, 0, x, y, 1, image_yscale, 0, c_white, 1);
else
	draw_sprite_ext(sprite_index, 1, x, y, 1, image_yscale, 0, c_white, 1);
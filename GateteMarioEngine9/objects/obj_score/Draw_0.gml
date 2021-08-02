/// @description Draw score

//Align text
draw_set_halign(fa_center);

//Set up font
draw_set_font(font);

//If this object is giving extra lives, draw sprite
if (value < 0)
&& (sprite_index > -1)
	draw_sprite(sprite_index, -1, x, y);
else {

	draw_text(x-1, y, string(value)); 
}

//Reset alignment
draw_set_halign(fa_left);
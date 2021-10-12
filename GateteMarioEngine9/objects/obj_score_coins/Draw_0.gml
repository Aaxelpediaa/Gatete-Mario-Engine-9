/// @description Draw text

//Set the colour
draw_set_colour(c_white);

//Set the font
draw_set_font(font);

//Align
draw_set_halign(fa_center);

//Set palette
pal_swap_set(spr_palette_score, flash);

//Draw text
draw_text(round(x), round(y), string(amount));

//Reset palette
pal_swap_reset();

//Realign
draw_set_halign(fa_left);
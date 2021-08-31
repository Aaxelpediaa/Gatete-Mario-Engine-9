/// @description Draw the block

//If the block has not been bumped yet
if (ready < 2) {

	//Draw the item inside
	if (sprout[numb] == cs_bomb)
	|| (sprout[numb] == cs_propeller)
	    draw_sprite_part(macro_get_sprite(sprout[numb]), 0, 0, 5, 16, 21, round(x), round(y));
	else {

	    if (sprout[numb] == cs_raccoon)
	        draw_sprite(macro_get_sprite(sprout[numb]), 1, round(x)+8, round(y));
	    else
	        draw_sprite(macro_get_sprite(sprout[numb]), 0, round(x)+8, round(y));
	}
}

//Draw the block
draw_sprite(sprite_index, -1, round(x), round(y));
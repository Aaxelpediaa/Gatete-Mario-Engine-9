/// @description Finish block bump

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Make an item come out, if there is one
if (sprout != cs_coin) {
	
	//If there's an item greater than a mushroom inside, sprout either a mushroom or the given powerup
	if ((sprout > cs_big) && (sprout < cs_mega))
	&& ((global.powerup == cs_tiny) || (global.powerup == cs_small))
		sprout = cs_big;
        
    //Create the item
    if (sprout != cs_coin)
        with (instance_create_depth(x+8, y, 10, obj_powerup_sprout))       
            sprite_index = macro_get_sprite(other.sprout);
}

//Allow block to be bumped again
ready = 0;
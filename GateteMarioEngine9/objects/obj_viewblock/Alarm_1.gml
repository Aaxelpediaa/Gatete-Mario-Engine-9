/// @description Finish block bump

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Make an item come out, if there is one        
with (instance_create_depth(x+8, y, 10, obj_powerup_sprout)) {
     
    sprite_index = macro_get_sprite(other.sprout[other.numb]);
}

//Do not allow bump
ready = 2;
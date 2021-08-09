/// @description Freeze all objects and begin animation

//Activate player object and disable it's gravity
instance_activate_object(obj_mario);
obj_mario.enable_gravity = 0;
obj_mario.visible = 0;

//Set the animation sequence.
switch (sequence) {

    //Small to Big
    case (0): sprite_index = spr_mario_grow; break;
    
    //Big to Small
    case (1): sprite_index = spr_mario_shrink; break;
    
    //Power up
    case (2): {
    
        sprite_index = spr_mario_powerup;
        loop = 3;
    } break;
    
    //Power down
    case (3): {
    
        sprite_index = spr_mario_powerdown;
        loop = 6;
    } break;
    
    //Transform
    case (4): sprite_index = spr_mario_transform; break;
}

//Animation has been set.
ready = true;

//Make the object visible.
visible = true;
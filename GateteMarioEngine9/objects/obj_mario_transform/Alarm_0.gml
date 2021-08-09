/// @description Freeze all objects and begin animation

//Create a snapshot
snapshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 1, 0, 0);

//Deactivate all instances
instance_deactivate_all(1);

//Activate coordinator object
instance_activate_object(obj_coordinator);

//Activate player object and disable it's gravity
instance_activate_object(obj_mario);
with (obj_mario) {
	
	enable_gravity = 0;
	visible = 0;
}

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
ready = 1;

//Make the object visible.
visible = 1;
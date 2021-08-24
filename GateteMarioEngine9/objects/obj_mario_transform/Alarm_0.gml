/// @description Freeze all objects and begin animation

//Activate Mario, make him invisible and disable it's gravity
instance_activate_object(obj_mario);
with (obj_mario) {
	
	enable_gravity = 0;
	visible = 0;
}

//Set the animation sequence.
switch (sequence) {
	
	//Big to Tiny
	case (-3): sprite_index = spr_mario_shrink_big_to_tiny; break;
	
	//Small to Tiny
	case (-2): sprite_index = spr_mario_shrink_small_to_tiny; break;
	
	//Tiny to Big
	case (-1): sprite_index = spr_mario_grow_tiny_to_big; break;

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
	
	//Mega Grow
	case (5): {
		
		//Turn Mario invisible
		obj_mario.visible = false;
		
		//Set sprite
		sprite_index = spr_mario_grow_to_mega;
		
		//Set special state
		ready = 2;
		
		//Do not animate
		image_speed = 0;
		image_index = 0;
		
		//Turn visible
		visible = true;
		
		//Create screenshot
		freeze_create();
		
		//Exit
		exit;
	}
	
	//Mega Shrink
	case (6): {
		
		//Turn Mario invisible
		obj_mario.visible = false;
	
		//Set sprite
		sprite_index = obj_mario.sprite_index;
		
		//Set special state
		ready = 2;
		
		//Do not animate
		image_speed = 0;
		image_index = obj_mario.image_index;
		
		//Turn visible
		visible = true;
		
		//Create screenshot
		freeze_create();
		
		//Exit
		exit;
	}
}

//Animation has been set.
ready = 1;

//Make the object visible.
visible = 1;
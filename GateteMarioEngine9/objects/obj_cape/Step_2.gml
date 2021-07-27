/// @description Manage cape

#region POSITION

	//If the player does exist
	if (instance_exists(obj_mario)) {

	    //Move towards the player
	    x = obj_mario.x;
	    y = obj_mario.y;
    
	    //Hereby facing direction
	    image_xscale = obj_mario.xscale;
	}
	else
	    exit;
#endregion

#region ANIMATION

	//Cape - Idle
	if (state == capestate.cape_idle) {

	    //If the following cape sprites are not used
	    if (sprite_index != spr_cape)
	    && (sprite_index != spr_cape_down) {
    
	        //Set up the sprite
	        sprite_index = spr_cape_down;
        
	        //Animate
	        image_speed = 0.2;
	        image_index = 0;
	    }
	}

	//Cape - Walk
	else if (state == capestate.cape_walk) {

	    //If the following cape sprites are not used
	    if (sprite_index != spr_cape_up)
	    && (sprite_index != spr_cape_walk) {
    
	        //Set up the sprite
	        sprite_index = spr_cape_up;
        
	        //Animate
	        image_speed = 0.2;
	        image_index = 0;
	    }
    
	    //If the following cape sprite is being used, update based on hspeed
	    if (sprite_index == spr_cape_walk) {
    
	        if (obj_playerparent.flying > 0)
	            image_speed = 0.15;
	        else
	            image_speed = 0.065+abs(obj_playerparent.hspeed)/7.5;
	    }
	}

	//Cape - Jump Up
	else if (state == capestate.cape_jump_up) {

	    //If the following cape sprite are not used
	    if (sprite_index != spr_cape)
	    && (sprite_index != spr_cape_down) {
    
	        //Set up the sprite
	        sprite_index = spr_cape_down;
        
	        //Animate
	        image_speed = 0.2;
	        image_index = 0;
	    }
	}

	//Cape - Jump Down
	else if (state == capestate.cape_jump_down) {

	    //If the following cape sprite are not used
	    if (sprite_index != spr_cape_up)
	    && (sprite_index != spr_cape_fall) {
    
	        //Set up the sprite
	        sprite_index = spr_cape_up;
        
	        //Animate
	        image_speed = 0.2;
	        image_index = 0;
	    }
	}

	//Cape - Spin Up
	else if (state == capestate.cape_spin_up) {

	    //Set up the sprite
	    sprite_index = spr_cape_spin;
    
	    //Animate
	    image_speed = 0.5;
	}

	//Cape - Spin Down
	else if (state == capestate.cape_spin_down) {

	    //Set up the sprite
	    sprite_index = spr_cape_spin_fall;
    
	    //Animate
	    image_speed = 0.5;
	}

	//Cape - Climb
	else if (state == capestate.cape_climb) {

	    //Set up the sprite
	    sprite_index = spr_cape_climb;
    
	    //Do not animate
	    image_speed = 0;
	    image_index = 0;
	}
    
	//Set up idle frame
	if (sprite_index == spr_cape)
	    image_index = global.mount;
#endregion
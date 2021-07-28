/// @description Manage cape

function manage_cape_states() {
	
	#region SPECIAL STATES
	
	// Climbing
	if (my_owner.state == playerstate.climb) {
		
		state = capestate.cape_climb;
		
	}
	
	#endregion
	
	#region GROUNDED
	
	else if (my_owner.yadd == 0 && my_owner.yspeed == 0) {
		
		// If walking/sliding/etc.
		if (my_owner.xspeed != 0) {
			
			state = capestate.cape_walk;
			
		// If idling
		} else {
				
			state = capestate.cape_idle;
				
		}
		
	}
	
	#endregion
	
	#region OFF THE GROUND
	
	else {
		
		// Not spin jumping
		if (my_owner.jumpstyle == 0) {
			
			// If they're flying
			if (my_owner.flying == true) {
			
				state = capestate.cape_walk;
				
			}
		
			// If going up
			else if (my_owner.yspeed <= 0) {
				
				if (my_owner.swimming) {
					
					state = capestate.cape_walk;
					
				} else {
		
					state = capestate.cape_jump_up;
				
				}
		
			// If going down
			} else {
			
				state = capestate.cape_jump_down;	
			
			}
		
		// Spin jumping
		} else {
			
			// If going up
			if (my_owner.yspeed <= 0) {
		
				state = capestate.cape_spin_up;
		
			// If going down
			} else {
			
				state = capestate.cape_spin_down;	
			
			}
			
			show_debug_message("I'm spinning");
			
		}
		
	}
	
	#endregion
	
}

#region POSITION

	//If the player does exist
	if (instance_exists(my_owner)) {

	    //Move towards the player
	    x = my_owner.x;
	    y = my_owner.y;
    
	    //Hereby facing direction
	    image_xscale = my_owner.xscale;
		
		// Set cape depth
		switch (my_owner.state) {
			
			default:
				depth = my_owner.depth + 1;
				break;
				
			case (playerstate.climb):
				depth = my_owner.depth - 1;
				break;
			
		}
		
		#region STATE MANAGEMENT
		
		manage_cape_states();
		
		#endregion
		
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
	        image_speed = 0.1;
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
    
	        if ((my_owner.flying > 0) && (my_owner.jumpstyle == 0 || global.powerup != cs_cape))
	            image_speed = 0.15;
	        else
	            image_speed = 0.065+abs(my_owner.xspeed)/7.5;
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
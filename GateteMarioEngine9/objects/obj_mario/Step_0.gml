/// @description Mario's logic!

//If active, manage P-Wing
if (global.pwing == 1) {

	//If Mario does not have the raccoon or tanooki powerups
	if (global.powerup != cs_raccoon)
	&& (global.powerup != cs_tanooki) {
	
		//Disable P-Wing
		global.pwing = false;
		
		//End flight
		flying = 0;
		
		//Reset P-Meter
		pmeter = 0;
	}
	
	//Keep P-Meter full
	pmeter = 112;
	
	//Keep flight time active
	timer(pmeter_end, 60 * global.flighttime, false);
	
	//If the 'P-Meter' sound is not playing, play it
	if (!audio_is_playing(snd_pmeter)) {
		
		audio_play_sound(snd_pmeter, 0, true);
	}
	
	//If the player is on the ground, do not apply fix
	if (state != 2)
		flyfix = 0;
	else
		flyfix = 1;
}

//Otherwise, do not apply fix.
else {

	//If the player is on the ground, do not apply fix
	if (state != 2) && (flying == 0)
		flyfix = 0;
	else
		flyfix = 1;
}

//If gravity is enabled
if (enable_gravity == 1) {

	//Reset hspeed, vspeed and gravity default variables as they are not used in this object
	hspeed = 0;
	vspeed = 0;
	gravity = 0;
	
	//Update position based on xspeed and yspeed values
	x += xspeed;
	y += yspeed;
	xspeed += xadd;
	yspeed += yadd;
	
	//Decrease net smack
	netsmack--;
	
	//Manage stun time
	if (stuntime > 0) {
	
		//If the stun status is about to end
		if (stuntime == 1) {
		
			//Stop stun state
			stuntime = 0;
			
			//Stop shaking
			shake = 0;
			
			//Enable controls again
			enable_control = true;
		}
		
		//Decrease stun time
		stuntime--;
		
		//Set up shake offset
		shake = -shake;
	}
	
	//Manage freeze time
	if (freezetime > 0) {
	
		//If the freeze status is about to end
		if (freezetime == 1) {
		
			//Play 'Shatter' sound
			//audio_stop_play_sound(snd_shatter, 0, false);
			
			//Repeat 32 times
			repeat (32) {
			
				with (instance_create_layer(bbox_left + sprite_width/2 - 4, bbox_top + sprite_height / 2 - 4, "Front", obj_smoke)) {
				
					//Set up sprite
					sprite_index = spr_sparkle_small;
					
					//Animate
					image_speed = 0.1;
					
					//Motion
					motion_set(random(360), random(1));
				}
			}
			
			//Stop freeze status
			freezetime = 0;
			
			//Enable controls
			enable_control = true;
			
			//Give Mario temporary invulnerability
			event_user(6);
		}
	}
	
	//Make sure Mario is spinning when not having the propeller powerup
	if (global.powerup != cs_propeller)
	&& (jumpstyle == 2)
		jumpstyle = 1;
		
	//Make sure Mario stops spinning when holding something
	if ((holding > 0) && (holding < 4))
	&& (jumpstyle > 0)
		jumpstyle = 0;
		
	//Mute sounds when climbing or while swimming when having either frog or penguin powerups
	if (state == 3)
	|| ((state == 2) && (swimming == true) && ((global.powerup == cs_frog) || (global.powerup == cs_penguin)))
		noisy = 1;
	else
		noisy = 0;
		
	//Manage semisolid collisions
	floor_collision();
	
	//Conveyor collisions
	//conveyor_collision();
	
    //If the player is not swimming
    if (swimming == false) {
    
        //If the player is not sliding
        if (!sliding) {
    
            //If the player is not climbing
            if (state != 3) {
        
                //Execute main and walljump behaviour scripts
                event_user(2);
				event_user(3);
                
                //If the player is running on walls or ceilings
				if (global.mount != 2)
                && (instance_number(obj_wallrunner) == 0) {
                
                    //If the P-Meter is full.
                    if (pmeter > 112) {
                    
                        /*Play 'P-Meter' sound
						if (!audio_is_playing(snd_pmeter))
							audio_play_sound(snd_pmeter, 0, true);
						*/
                        
                        //Keep P-Meter full.
                        pmeter = 112;
                    
                        //Make the player able to run.
                        run = true;
                    }
                    
                    //Otherwise, fill P-Meter
                    else
                        pmeter += 2;
                }
                
                //Otherwise...
                else {
                
                    //If the player's horizontal speed is equal/greater than 2.4 and it's not wearing a kuribo shoe.
                    if (abs(xspeed) > 2.6) 
                    && (global.mount != 2) 
                    || (global.pwing == 1) {
                    
                        //If the player is not jumping.
                        if (state < 2) {
                        
                            //If the P-Wing is active
                            if (global.pwing == 1) {
                            
                                /*Play 'P-Meter' sound
                                if (!audio_is_playing(snd_pmeter)) {
                                
                                    audio_play_sound(snd_pmeter, 0, true);
                                    if (pmeter < 112)
                                        pmeter = 112;
                                }
								*/
                            }
                            
                            //Otherwise
                            else {
                        
                                //If the P-Meter is full.
                                if (pmeter > 112) {
                                
                                    /*Play 'P-Meter' sound
                                    if (!audio_is_playing(snd_pmeter)) {
                                    
                                        audio_play_sound(snd_pmeter, 0, true);
                                    }
									*/
                                    
                                    //Keep P-Meter full.
                                    pmeter = 112;
                                
                                    //Make the player able to run.
                                    run = true;
                                }
                                
                                //Otherwise, fill P-Meter
                                else
                                    pmeter += 2;
                            }
                        }
                        
                        //If the player is on the ground and not running.
                        else if ((!run) && (pmeter > 0))
                            pmeter--;
                    }
                    
                    //Otherwise, if the player's horizontal speed is lower than 2.4
                    else if ((!run) || ((state < 2) && (abs(xspeed) < 2.6)) && (global.pwing == 0)) { 
                    
                        //If the player is flying and lands on the floor.
                        if (flying) {
                        
                            //Stop 'P-Meter' sound
                            //audio_stop_sound(snd_pmeter);
                            
                            //Allow the player to fly again.
                            flying = false;
                            
                            //Make the player walk
                            run = false;
                            
                            //Empty P-Meter.
                            if (pmeter > 0)        
                                pmeter --;
                        }
                        
                        //If the player is not flying.
                        else if (!flying) {
                        
                            //Stop 'P-Meter' sound
                            //audio_stop_sound(snd_pmeter);
                                                
                            //Make the player walk
                            run = false;
                            
                            //Restart flying.
                            alarm[9] = 0;
                            
                            //Empty P-Meter.
                            if (pmeter > 0)       
                                pmeter --;
                        }   
                    }
                }
            }
            
            //Otherwise, if the player is climbing.
            else if (state == 3) {
            
                //Execute climb behaviour script
                event_user(4);
				
				//Check the climb surface
				var climbsurface = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_climb, 0, 0);
				
				//If there's a climbable surface in position
				if (input_check_pressed(input.action_1))
				&& (netsmack == 0)
				&& (climbsurface)
				&& (climbsurface.image_xscale > 1) {
				
					//Play 'Bump' sound
					//audio_play_sound(snd_bump, 0, false);
					
					//Increment netsmack
					netsmack = 4;
					
					//Reverse horizontal scale
					xscale = -xscale;
				}
                
                //Stop P-Meter if not permanent
                if (global.pwing == 0) {
                
                    //Stop 'P-Meter' sound
                    //audio_stop_sound(snd_pmeter);
                                                                    
                    //Stop flight, run and reduce pmeter
                    flying = false;
                    run = false;
                    if (pmeter > 0)
                        pmeter--;
                }
            }
        }
        
        //Otherwise, if the player is sliding down a slope
        else if (sliding == true) {
        
            //Execute slide behaviour script
            event_user(5);
            
            //Stop P-Meter if not permanent
            if (global.pwing == 0) {
            
                //Stop 'P-Meter' sound
                //audio_stop_sound(snd_pmeter);
                                                                
	            //Stop flight, run and reduce pmeter
	            flying = false;
	            run = false;
	            if (pmeter > 0)
	                pmeter--;
            }
        }
    }
    
    //Otherwise, if the player is actually swimming.
    else if (swimming) {
        
        //Execute swim behaviour script
        event_user(6);
            
        //Stop P-Meter if not permanent
        if (global.pwing == 0) {
        
            //Stop 'P-Meter' sound
            //audio_stop_sound(snd_pmeter);
                                                            
            //Stop flight, run and reduce pmeter
            flying = false;
            run = false;
            if (pmeter > 0)
                pmeter--;
        }
    }
}
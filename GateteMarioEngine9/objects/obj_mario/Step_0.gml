/// @description Mario's logic!

//If Mario is under the effects of a mega mushroom
if (global.powerup == cs_mega) {
	
	crouch = false;
	ismega = 0;
	swim_y = -32;
}
else {
	
	if (global.powerup == cs_tiny) {
		
		crouch = false;
		ismega = 4;
		swim_y = 9;
	}
	else {
		
		ismega = 0;
		if (global.powerup == cs_small)
		|| (mask_index == spr_mask_mario)
			swim_y = 3;
		else
			swim_y = 0;
	}
}

//Handle position when on a slope
if (yspeed >= 0) {
	
	//If there's a slope collision in-position
	if (collision_rectangle(x-1, bbox_bottom-0.99, x+1, bbox_bottom+4.99, obj_slopeparent, 1, 0)) {
		
		//Calculate slope position
		slope_collision();
		
		//Stop vertical movement
		yadd = 0;
		yspeed = 0;
			
		//Reset values
		event_user(15);
	}
}

//If active, manage P-Wing
if (global.pwing == 1) {

	//If Mario does not have the raccoon or tanooki powerups
	if (global.powerup != cs_raccoon)
	&& (global.powerup != cs_tanooki) {
	
		//Disable P-Wing
		global.pwing = false;
		
		//Reset P-Meter
		pmeter = 0;

		//End flight
		flying = 0;
	}
	
	//Keep P-Meter active
	pmeter = 144;
	
	//Loop P-Meter sound
	if (!audio_is_playing(snd_pmeter))
		audio_play_sound(snd_pmeter, 0, true);
	
	//Keep flying time active
	flying_time = timer(pmeter_end, 60 * global.flighttime, true);
	
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
		
			/*Play 'Shatter' sound
			audio_stop_play_sound(snd_shatter, 0, false);
			
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
			
			*/
			
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
		
	//If moving down
	if (yspeed >= 0) {

		//Check for any nearby ground collision
		var semisolid = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_semisolid, 0, 0);
	
		//If there's ground below and Mario is not moving upwards
		if (semisolid)
		&& (bbox_bottom < semisolid.yprevious+5)
		&& (!collision_rectangle(x-1, bbox_bottom+1, x+1, bbox_bottom+4, obj_slopeparent, 1, 0)) {
		
			//Snap above the semisolid
			y = semisolid.bbox_top-16;
	
			//Stop vertical movement
			yadd = 0;
			yspeed = 0;
		
			//Reset values
			event_user(15);
		}
		
		//Check for a water surface
		var ws = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_swim, 0, 0);
		
		//If there's water and Mario is tiny and not jumping
		if (ws)
		&& (xspeed != 0)
		&& (global.powerup == cs_tiny) 
		&& (bbox_bottom < ws.yprevious+5) {

			//Snap above the semisolid
			y = ws.bbox_top-16;
	
			//Stop vertical movement
			yadd = 0;
			yspeed = 0;
		
			//Reset values
			event_user(15);
			
			//Reset state delay
			statedelay = 0;
			
			//Set up state if we didn't yet
			if (xspeed == 0)
				state = 0;
			else
				state = 1;
		}
	}
	
	//Conveyor collisions
	//conveyor_collision();
	
    //If the player is not swimming
    if (swimming == false) {
    
        //If the player is not sliding
        if (!sliding) {
    
            //If the player is not climbing
            if (state != 3) {
        
                //Execute main behaviour script
                event_user(2);
				
				//Execute walljump behaviour script
				event_user(3);
				
				//If the player is running on walls or ceilings
				if (global.mount != 2)
                && (instance_number(obj_wallrunner) == 1) {
                
                    //If the P-Meter is full.
                    if (pmeter > 144) {      
                        
                        //Keep P-Meter full.
                        pmeter = 144;
                    
                        //Make the player able to run.
                        run = true;
						
						//Play 'P-Meter' sound
						if (!audio_is_playing(snd_pmeter))
							audio_play_sound(snd_pmeter, 0, true);
                    }
                    
                    //Otherwise, fill P-Meter
                    else
                        pmeter += 2;
                }
                
                //Otherwise...
                else {
                
                    //If the player's horizontal speed is equal/greater than 2.6 and it's not wearing a kuribo shoe.
                    if (abs(xspeed) >= 2.6)
					&& (wallkick == 0)
                    && (global.mount != 2) 
                    || (global.pwing == 1) {
                    
                        //If the player is not jumping.
                        if (state < 2) {
                        
                            //If the P-Wing is active
                            if (global.pwing == 1) {
                            
                                //Play 'P-Meter' sound
                                if (!audio_is_playing(snd_pmeter)) {
                                
                                    audio_play_sound(snd_pmeter, 0, true);
                                    if (pmeter < 144)
                                        pmeter = 144;
                                }
                            }
                            
                            //Otherwise
                            else {
                        
                                //If the P-Meter is full.
                                if (pmeter > 144) {
                                    
                                    //Keep P-Meter full.
                                    pmeter = 144;
                                
                                    //Make the player able to run.
                                    run = true;
									
									//Play 'P-Meter' sound
									if (!audio_is_playing(snd_pmeter))
										audio_play_sound(snd_pmeter, 0, true);
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
                    
                    //Otherwise, if the player's horizontal speed is lower than 2.6
                    else if ((!run) || (wallkick > 0) || ((state < 2) && (abs(xspeed) < 2.6)) && (global.pwing == 0)) { 
                    
                        //If the player is flying and lands on the floor.
                        if (flying) {
                        
                            //Stop 'P-Meter' sound
                            audio_stop_sound(snd_pmeter);
                            
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
                            audio_stop_sound(snd_pmeter);
							
							//Destroy timer
							timer_destroy(flying_time);
                                                
                            //Make the player walk
                            run = false;
                            
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
					audio_play_sound(snd_bump, 0, false);
					
					//Increment netsmack
					netsmack = 4;
					
					//Reverse horizontal scale
					xscale = -xscale;
				}
                
                //Stop P-Meter if not permanent
                if (global.pwing == 0) {
                
                    //Stop 'P-Meter' sound
                    audio_stop_sound(snd_pmeter);
					
					//Stop flying
					flying = false;
                                                                    
                    //Stop running
					run = false;
					
					//Decrement P-Meter
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
                audio_stop_sound(snd_pmeter);
				
				//Stop flying
				flying = false;
                                                                    
                //Stop running
				run = false;
					
				//Decrement P-Meter
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
		    audio_stop_sound(snd_pmeter);
                                                                    
		    //Stop running
			run = false;
					
			//Stop flight
			flying = false;
		}
    }
	
	//If moving right and there's a wall in position
	if (xspeed > 0)
	&& (collision_rectangle(bbox_right, bbox_top+4, bbox_right+1, bbox_bottom-4+ismega, obj_solid, 1, 0)) {
		
		//Check for a block
		var block_r = collision_rectangle(bbox_right, bbox_top, bbox_right+1, bbox_bottom, obj_blockparent, 0, 0);
	
		//If Mario is sliding
		if (sliding == true) {
		
			//If the player has the shell powerup
			if (global.mount == 0)
			&& (global.powerup == cs_shell) {
			
				//Play 'Bump' sound
				audio_play_sound(snd_bump, 0, false);
				
				//Reverse horizontal speed
				xspeed = -xspeed;
				
				//Create effect
				//instance_create_layer(x+5, y+8, "Front", obj_shellbump);
				
				//Bump block if there's one in position
				if (block_r) {
				
					with (block_r) {
						
					}
				}
				
				//Exit this event
				exit;
			}
			
			//Otherwise, stop sliding behaviour
			else				
				sliding = false;
		}
		
		//Stop horizontal movement
		xspeed = 0;
		
		//Prevent Mario from getting embed on the wall
		while (collision_rectangle(bbox_right, bbox_top+4, bbox_right, bbox_bottom-4+ismega, obj_solid, 1, 0))
		&& (!collision_point(x, bbox_top+4, obj_solid, 0, 0))
			x--;
	}
	
	//Otherwise, if moving left
	else if (xspeed < 0)
	&& (collision_rectangle(bbox_left-1, bbox_top+4, bbox_left, bbox_bottom-4+ismega, obj_solid, 1, 0)) {
		
		//Check for a block
		var block_l = collision_rectangle(bbox_left-1, bbox_top, bbox_left, bbox_bottom, obj_blockparent, 0, 0);
	
		//If Mario is sliding
		if (sliding == true) {
		
			//If the player has the shell powerup
			if (global.mount == 0)
			&& (global.powerup == cs_shell) {
			
				//Play 'Bump' sound
				audio_play_sound(snd_bump, 0, false);
				
				//Reverse horizontal speed
				xspeed = -xspeed;
				
				//Create effect
				//instance_create_layer(x-5, y+8, "Front", obj_shellbump);
				
				//Bump block if there's one in position
				if (block_l) {
				
					with (block_l) {
						
					}
				}
				
				//Exit this event
				exit;
			}
			
			//Otherwise, stop sliding behaviour
			else				
				sliding = false;
		}
		
		//Stop horizontal movement
		xspeed = 0;
		
		//Prevent Mario from getting embed on the wall
		while (collision_rectangle(bbox_left, bbox_top+4, bbox_left, bbox_bottom-4+ismega, obj_solid, 1, 0))
		&& (!collision_point(x, bbox_top+4, obj_solid, 0, 0))
			x++;
	}
	
	//If moving upwards
	if (yspeed < 0) 
	&& (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_solid, 1, 0)) {
		
		//Check for a block above
		var block_u = collision_rectangle(bbox_left, bbox_top-2, bbox_right, bbox_top, obj_blockparent, 0, 0);
	
		//Prevent the player from getting stuck on a ceiling when jumping/climbing
		if (state > 1) {
			
			while (collision_rectangle(bbox_left, bbox_top+1, bbox_right, bbox_top+1, obj_solid, 1, 0))
				y++;
		}
		
		//Stop vertical movement
		yspeed = 0;
		
		//If there's a bumpable block above
		if (block_u) {
		
			with (block_u) {
				
			}
		}
		
		//If the player does not have the frog/penguin powerups and it's not climbing
		if (state < 3)
		&& (noisy == false) {
		
			//Max out bee powerup flight timer
			if (global.powerup == cs_bee) {
			
				beefly = 128;
			}
			
			//Stop variable jump
			jumping = 2;
			
			//Play 'Bump' sound
			if (!audio_is_playing(snd_bump))
				audio_play_sound(snd_bump, 0, false);
		}
	}
	
	//Prevent the player from overlappin' the ceiling
	if (state > 1)	
		while (collision_rectangle(bbox_left+1, bbox_top+1, bbox_right-1, bbox_top+1, obj_solid, 1, 0))
			y++;
	
	//If the player is not climbing
	if (state != 3) {
	
		//If the player controls are enabled and it's not jumping
		if (state != 2)
		&& (sliding == false)
		&& (enable_control == true) {
		
			//Make the player crouch down when the 'Down' key is held
			if (input_check(input.down))
			&& (global.powerup != cs_tiny)
			&& (global.powerup != cs_frog)
			&& (global.powerup != cs_mega)
			&& (crouch == false)
			&& (noisy == false)
				crouch = true;
				
			//Otherwise, if the 'Down' key is no longer pressed
			else if (!input_check(input.down))
				crouch = false;
		}
		
		/*Handles powerup specific projectiles, tail spin, cat scratching, etc...
		if (input_check_pressed(input.action_1))
		&& (obj_levelcontrol.barrier == false)
		&& (enable_control == true)
			timer(throw_projectile, 1, false);
		*/
	}

	//Otherwise, cancel crouch and spin jump
    else {
    
        //Make the player get up
        crouch = false;
        
        //Stop special jump
        jumpstyle = 0;
    }
	
    //Check for a nearby swimming surface
    var water = collision_rectangle(bbox_left, y+swim_y-1, bbox_right, y+swim_y, obj_swim, 1, 0);
    
    //If the player is not swimming and makes contact with a water surface
    if ((!swimming) && (water)) {
        
        //Make the player swim.
        swimming = true;
        swimtype = 0;
        
        //Make the player get up
        crouch = false;
        
        //Stop most horizontal movement
        xspeed = xspeed/2.5;
                
        //Stop vertical movement
        yadd = 0;
        if (yspeed > 0) {
        
            //Stop vertical movement
            yspeed = 0;
            
            /*Create a splash effect if not in contact with a bubble
            if (water.object_index != obj_waterbubble) {
            
                with (instance_create(x-8,water.y-15,obj_smoke)) {
                
                    depth = -4;
                    sprite_index = spr_splash;
                }            
            } */
        }
    }
    
    //Otherwise, if the player had enough swimming and wants to get out
    else if ((swimming) && (!water)) {
    
        //If there's not water above and there's not a solid on the way out
        if (!collision_rectangle(bbox_left, y+swim_y, bbox_right, y+swim_y, obj_solid, 1, 0)) {
        
            //If the player is moving up
            if ((state == 2) && (yspeed < 0)) {
            
                //If 'Shift' is held
                if (input_check(input.action_0)) {
                
                    //Switch between powerups
					switch (global.powerup) {
						
						case (cs_tiny):
							audio_play_sound(snd_jump_tiny, 0, false);
							break;
						
						default: 
							audio_play_sound(snd_jump, 0, false);
							break;
					}
                    
                    //Make the player not swim
                    swimming = false;
                    
                    //Allow variable jump
                    jumping = 1;
                    
                    /*Create splash effect
                    if (!collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_waterbubble,1,0)) {
                    
                        with (instance_create(x-8,y-15,obj_smoke)) {
                        
                            depth = -4;
                            sprite_index = spr_splash;
                        }
                    }*/
					
					//If Mario is not tiny
					if (global.powerup != cs_tiny)
						yspeed = -3.4675+abs(xspeed)/7.5*-1;
					else
						yspeed = -2.7375+abs(xspeed)/7.5*-1;
                }
                
                //Otherwise, if 'Shift' is not held.
                else {
                
                    //If the player is moving up.
                    if (yspeed < 0)
                        yspeed = 0;
                }
            }
        }
    }
	
	//If the player gets stuck in a wall
	if (yspeed == 0)
	&& (crouch == false)
	&& (mask_index == spr_mask_mario_big) {
	
        //If the player gets stuck
        if (collision_rectangle(bbox_left, bbox_top+4, bbox_right, bbox_top+4, obj_solid, 1, 0)) 
        && (inwall == 0) {
        
            //If the direction was not set
            if (direct2 == 0) {
            
                //Set it up
                direct2 = xscale;
            }
            
            //Begin movement
            inwall = 1;
            
            //Set the movement direction
            direct = -direct2;
        }
        
        //Otherwise, if the player gets stuck on a wall.
        else if (inwall == 1) {
            
            //Move the player until it's not embed in a wall.
            x += 1*sign(direct);       
            
            //If the player is not longer embed on a wall, make him able to move.
            if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solid, 1, 0)) {
            
                inwall = 0;
                direct2 = 0;
            }
            
            //If the player collides with a wall while being stuck
            if ((direct == -1) && (collision_line(bbox_left, y+4, bbox_left, bbox_bottom-4, obj_solid, 1, 0)))
            || ((direct == 1) && (collision_line(bbox_right, y+4, bbox_right, bbox_bottom-4, obj_solid, 1, 0)))
                direct = -direct;
        }		
	}
        
    //Handle tail whip animation
    if ((state == 2) && (wiggle > 0))
        wiggle--;
    else
        wiggle = 0;
    
    //If the player is not in contact with water.
    if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_swim, 0, 0)) {
    
        //If the player is swimming.
        if (swimming)  
            swimming = false;
    }
    
    //Prevent the player from going too high on the level
    if (y < -96)
        y = -96;
        
    //Otherwise, if he is falling.
    else {
    
        //If the player is below the bottom room boundary and didn't activate a warp, restart the room.
        if (bbox_bottom > room_height+32) {
                    
            if (pitwarp == false) {
            
                instance_create_layer(x, y, "Front", obj_mario_dead);
                instance_destroy();
                exit;  
            }
            
            else {
            
                //Force the player to fall.
                yspeed = 4;
            }       
        }
    }
}
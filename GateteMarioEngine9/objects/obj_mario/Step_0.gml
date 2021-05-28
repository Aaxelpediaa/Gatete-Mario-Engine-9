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
			audio_stop_play_sound(snd_shatter, 0, false);
			
			//Repeat 32 times
			repeat (32) {
			
				with (instance_create_layer(bbox_left + sprite_width/2 - 4, bbox_top + sprite_height / 2 - 4, "Effects", obj_smoke)) {
				
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
		
	#region COLLISIONS
	
	#endregion
}
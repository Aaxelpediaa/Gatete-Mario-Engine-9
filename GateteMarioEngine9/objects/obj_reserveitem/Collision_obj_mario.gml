/// @description Obtain powerup

//If Mario does not have the 'Mega' powerup
if (global.powerup != cs_mega) {

	//If the reserve item is a mushroom
	if (sprite_index == spr_mushroom) {

		//If Mario is tiny or small
		if (global.powerup == cs_tiny)
		|| (global.powerup == cs_small) {
	
			//Play 'Powerup' sound.
			audio_play_sound(snd_powerup, 0, false);
        
			//Perform animation sequence
			with (instance_create_depth(0, 0, -5, obj_mario_transform)) {
		
				if (global.powerup == cs_tiny)
					sequence = -1;
				else
					sequence = 0;
			}
	
			//Turn Mario into 'Super' Mario.
			global.powerup = cs_big;
		}
    
		//Otherwise, get a reserve mushroom
		else {
    
			//If there's a tiny shroom in reserve or there's not a item in reserve
			if (global.reserve == cs_tiny)
				exit;
		
			//Otherwise, if there's not a item in reserve
			else if (global.reserve == cs_small) {
					
				//Play 'Reserve' box
				audio_play_sound(snd_reserve, 0, false);
		
				//Reserve a mushroom
			    global.reserve = cs_big;
			}
	
			//Otherwise, if there's an item in reserve
			else
				audio_play_sound(snd_reserve, 0, false);
		}
	}

	//Otherwise
	else {

		//If the player is big and there's NOT an item on reserve.
		if (global.powerup == cs_big) 
		&& (global.reserve == cs_small)
			global.reserve = cs_big;

		//Otherwise, if the player does have a powerup.
		else if (global.powerup > cs_big)
			global.reserve = global.powerup;

		//If the player does not have the correct powerup.
		if (global.powerup != sprite_get_macro(sprite_index)) {

			//Give out the correct powerup
			global.powerup = sprite_get_macro(sprite_index);
    
			//Perform animation sequence and play sound
			with (instance_create_depth(0, 0, -5, obj_mario_transform)) {
    
			    sequence = other.sequence;
			    if (other.sequence != 4)
			        audio_play_sound(snd_powerup, 0, false);
			    else {
			
					if (other.sprite_index == spr_feather)
						audio_play_sound(snd_feather, 0, false);
					else
						audio_play_sound(snd_transform, 0, false);
				}
			}
		}
		else {
		
			//Play 'Reserve' sound
			audio_play_sound(snd_reserve, 0, false);
		}
	}
}

//Otherwise, reserve the picked up powerup
else {
	
	//Play 'Reserve' sound
	audio_play_sound(snd_reserve, 0, false);
		
	//Set this powerup as reserve
	global.reserve = sprite_get_macro(sprite_index);
}

//Destroy
instance_destroy();
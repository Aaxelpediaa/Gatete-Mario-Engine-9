/// @description Get a powerup

//Get 1000 points
with (instance_create_depth(x, y, -6, obj_score)) value = 1000;

//If Mario does not have the mega powerup
if (global.powerup != cs_mega) {

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

	    //Play 'Powerup' sound
	    audio_play_sound(snd_powerup, 0, false);
	}
}
else {
	
	//Play 'Reserve' sound
	audio_play_sound(snd_reserve, 0, false);
}

//Destroy
instance_destroy();
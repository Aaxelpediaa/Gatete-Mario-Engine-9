/// @description Transform into Mega Mario

//If Mario is not in the mega form
if (global.powerup != cs_mega) {

	//Play 'Powerup / Mega' sound.
	audio_play_sound(snd_powerup_mega, 0, false);
        
	//Perform animation sequence
	with (instance_create_depth(0, 0, -5, obj_mario_transform)) {
		
		sequence = 5
	}
	
	//Turn Mario into 'Super' Mario.
	global.powerup = cs_mega;
}

//Otherwise
else {
	
	//Play 'Powerup' sound
	audio_play_sound(snd_powerup, 0, false);
	
	//If the timer exists
	if (instance_exists(obj_megashroom_timer)) {

	    //Extend the timer on his megashroom_timer
	    obj_megashroom_timer.alarm[0] = 840;
	    obj_megashroom_timer.alarm[1] = 1;
    
	    //Deny megashroom_timer end.
	    if (obj_megashroom_timer.alarm[1] > 0)    
	        obj_megashroom_timer.alarm[1] = -1; 
	}
}

//Get 1000 points
with (instance_create_depth(x, y, -5, obj_score)) value = 1000;

//Destroy
instance_destroy();
/// @description Get 'Tiny' player status

//If the player is not Tiny and does not have the Mega powerup
if (global.powerup != cs_tiny) {

	//If the powerup is the mega mushroom
	if (global.powerup == cs_mega) {
		
		//Play 'Reserve' sound
		audio_play_sound(snd_reserve, 0, false);
	
		//Add a 'Tiny' shroom to the reserve box
		if (global.reserve != cs_tiny)
			global.reserve = cs_tiny;
	}
	
	else {

		//Play 'Mini' sound.
		audio_play_sound(snd_mini, 0, false);
        
		//Perform animation sequence
		with (instance_create_depth(0, 0, -5, obj_mario_transform)) {
		
			if (global.powerup >= cs_big)
				sequence = -3;
			else
				sequence = -2;
		}
	
		//Turn Mario into 'Tiny' Mario.
		global.powerup = cs_tiny;
	}
}
else {

	//Play 'Reserve' sound
	audio_play_sound(snd_reserve, 0, false);
	
	//Add a 'Tiny' shroom to the reserve box
	if (global.reserve != cs_tiny)
		global.reserve = cs_tiny;
}

//Get 1000 points
with (instance_create_depth(x, y, -5, obj_score)) value = 1000;

//Destroy
instance_destroy();
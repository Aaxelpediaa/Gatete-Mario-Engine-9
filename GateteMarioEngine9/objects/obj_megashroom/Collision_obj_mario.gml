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

//Get 1000 points
with (instance_create_depth(x, y, -5, obj_score)) value = 1000;

//Destroy
instance_destroy();
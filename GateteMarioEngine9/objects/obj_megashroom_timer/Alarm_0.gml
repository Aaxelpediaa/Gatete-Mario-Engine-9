/// @description End mega shroom

//Stop 'Starman' sound
audio_stop_sound(snd_megashroom);

//Play the music from the level
obj_levelcontrol.alarm[0] = 1;

//If Mario does exist
if (instance_exists(obj_mario)) {
	
	//Play 'Warp' sound
	audio_play_sound(snd_warp, 0, false);

	//Make Mario vulnerable and shrink
	obj_mario.invulnerable = false;
	with (instance_create_depth(0, 0, -5, obj_mario_transform)) {
	
		loop_me = 1;
		scale = 4;
		sequence = 6;
	}
	
	//Set 'Big' powerup
	global.powerup = cs_big;
}

//Destroy
instance_destroy();
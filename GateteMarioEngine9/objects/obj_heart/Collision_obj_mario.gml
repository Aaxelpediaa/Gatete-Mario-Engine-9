/// @description Grant one extra hit

//Play 'Powerup' sound
audio_play_sound(snd_powerup, 0, false);

//Grant an extra hit
if (global.safeguard < 3) {
	
	global.safeguard++;
}

//Get 500 points
with (instance_create_depth(x, y, -6, obj_score)) value = 500;

//Destroy
instance_destroy();
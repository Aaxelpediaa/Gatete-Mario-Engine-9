/// @description Start the challenge

//Play 'P-Balloon' sound
audio_play_sound(snd_pballoon, 0, false);

//Create moving coin
with (instance_create_depth(x, y, -5, obj_coinblock_active)) {

	coins = other.coins;
	prize = other.prize;
}

//Destroy
instance_destroy();
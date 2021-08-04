/// @description Destroy object

//Play 'Thud' sound
audio_play_sound(snd_thud, 0, false);

//Repeat 32 times
repeat (32) {
	
	with (instance_create_depth(x, y+8, -2, obj_sparkle)) {
	
		sprite_index = spr_sparkle_b;
		motion_set(random(360), random(2));
	}
}

//Create ring effect
instance_create_depth(x, y+8, -2, obj_blend_ring);

//Destroy
instance_destroy();
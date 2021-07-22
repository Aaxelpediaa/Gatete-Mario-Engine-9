/// @description Timer Actions

//Make Mario vulnerable to all hazards
become_vulnerable = function(_timer) {

	//Make Mario vulnerable to all hazards
	invulnerable = 0;
	
	//Destroy the repeating timer
	timer_destroy(_timer);
}

//Makes Mario blink when invulnerable
change_alpha = function() {
	
	image_alpha = !image_alpha;
}

//Ends P-Meter flight
pmeter_end = function() {

	//Allow Mario to fly again
	flying = 0;
	
	//Reset pmeter
	pmeter = 0;
	
	//End run
	run = false;
	
	//Stop 'P-Meter' sound
	if (audio_is_playing(snd_pmeter))
		audio_stop_sound(snd_pmeter);
}

//End turning
turning_end = function() {

	turning = 0;
}

//Allow wallkick
wallkick_allow = function() {

	wallkick = 0;
	wallready = 0;
}

//Throws projectiles
throw_projectile = function() {

	
}
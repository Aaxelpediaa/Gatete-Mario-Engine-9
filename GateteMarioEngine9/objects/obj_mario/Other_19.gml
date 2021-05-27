/// @description Timer actions

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
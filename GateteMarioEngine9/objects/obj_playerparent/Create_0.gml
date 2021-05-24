/// @description Player Parent

// Scale variables
xscale = 1;
yscale = 1;

//Player colour
isflashing = 0;

//Extra functions
become_vulnerable = function(_timer) {

	//Make the player vulnerable to all hazards
	invulnerable = false;
	
	//Destroy the repeating timer
	timer_destroy(_timer);
}
change_alpha = function() {

	image_alpha = !image_alpha;
}
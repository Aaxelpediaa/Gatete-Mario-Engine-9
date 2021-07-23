/// @function					pal_swap_set_player();
/// @param	normal_palette		Normal palette
/// @param invincible_palette	Invincible palette

function pal_swap_set_player() {
	
	//Local function variables
	var pal, spr;
	
	//If the player isn't invincible, set up your palette
	if (isflashing <= 0) {
		
		//Set normal palette sprite
		spr = argument[0];
	
		switch (global.powerup) {
		
			default: pal = 0; break;				// Normal color
			case (cs_fire): pal = 1; break;			// Fire palette
			case (cs_ice): pal = 2;	break;			// Ice palette
			case (cs_superball): pal = 3; break;	// Superball palette
			case (cs_volt): pal = 4; break;			// Volt palette
			case (cs_gold): pal = 5; break;			// Gold palette		
		}
		
	} else {
		
		//Set invincibility palette sprite(?)
		spr = argument[1];
		pal = isflashing;
		
	}
	
	//If no palette swap occurred, exit the script
	if (pal == 0)	
		exit;
	
	//Otherwise, set the palette swap
	pal_swap_set(spr, pal);

}
/// @description Mario's animation!

//Set up the mask if Mario is not tiny or mega
if (global.powerup != cs_tiny)
&& (global.powerup != cs_mega) {

	//If the player is crouched down
	if (crouch)
		mask_index = spr_mask_mario;
	else {
		
		if (global.powerup == cs_small)
			mask_index = spr_mask_mario;
		else
			mask_index = spr_mask_mario_big;
	}
}

//Otherwise, if the player is Tiny
else if (global.powerup == cs_tiny)
	mask_index = spr_mask_mario_tiny;
	
//Otherwise, if the player is Mega
else if (global.powerup == cs_mega)
	mask_index = spr_mask_mario_mega;
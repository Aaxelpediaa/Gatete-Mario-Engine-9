/// @description Mega Mushroom logic

//Inherit the parent event
event_inherited();

//If there's no gravity
if (yadd == 0) {
	
	//If this item is meant to move after landing, move it
	if (move_after_landing == 1) {

		//Deny this event
		move_after_landing = 0;
	
		//Set the vertical
		yspeed = -(1.5 - (swimming * 0.75));
		y--;
	
		//Set the horizontal speed
		if (!instance_exists(obj_mario))
		|| (obj_mario.x < x)
			xspeed = -1;
		else
			xspeed = 1;
	}
	
	//Otherwise
	else if (can_bounce == true) {
	
		yspeed = -(1.5 - (swimming * 0.75));
		y--;
	}
}
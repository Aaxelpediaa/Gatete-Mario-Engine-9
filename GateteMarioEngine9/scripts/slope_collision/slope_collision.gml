function slope_collision() {

	slopesensor_slopeid = noone;

	if (yadd == 0)
	    slopesensor_extendedcheck = 6; //The checking line will be longer when the player is not on air, to prevent him from not checking while moving.
	else
	    slopesensor_extendedcheck = 0;

	//The following applies to every "obj_slopeparent" in the room.
	//If you have too many instances of this object, the game will suffer slowdowns, so be sure to deactivate the ones that are far from the player. 
	with (obj_slopeparent) {
		
	    //Find the height of the slope at obj_mario's slopesensor_x. It will be used to put obj_mario on top of the slope.
	    mariopointinslope_y = (slope_y1) + ((slope_y2 - slope_y1) * (((obj_mario.x + obj_mario.slopesensor_x) - (slope_x1)) / (slope_x2 - slope_x1)))
    
	    if (((obj_mario.x + obj_mario.slopesensor_x) >= slope_x1
	    && (obj_mario.x + obj_mario.slopesensor_x) <= slope_x2
	    && slope_x2 > slope_x1) //If the player is inside the area of slope_x1 and slope_x2, and slope_x2 is higher than slope_x1.
    
	    || ((obj_mario.x + obj_mario.slopesensor_x) >= slope_x2
	    && (obj_mario.x + obj_mario.slopesensor_x) <= slope_x1
	    && slope_x2 <= slope_x1) ) //If the player is inside the area of slope_x1 and slope_x2, and slope_x1 is higher than slope_x2. (Though none of the slope objects in this example have their slope_x1 higher than slope_x2)
    
	    && ((obj_mario.y + obj_mario.slopesensor_y2 + obj_mario.slopesensor_extendedcheck) >= mariopointinslope_y) //If the bottom of obj_mario's checking line (slopesensor_y2) is lower than "mariopointinslope_y".
	    && (obj_mario.y + obj_mario.slopesensor_y1) <= mariopointinslope_y //If the top of obj_mario's checking line (slopesensor_y1) is higher than "mariopointinslope_y".
    
	    && obj_mario.yspeed >= -0.85 //Will only check for slopes when the player's vspeed is equal or higher than 0.
	        obj_mario.slopesensor_slopeid = id; //The ID of the slope found by obj_mario's checking line will be stored in "slopesensor_slopeid".
	}

	if (yadd == 0)
	&& (slopesensor_slopeid != noone)
	    y = (slopesensor_slopeid).mariopointinslope_y - slopesensor_y2; //Set obj_mario on top of the slope found by the "sensor line".
}
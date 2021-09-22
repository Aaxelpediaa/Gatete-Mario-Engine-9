function slope_collision() {

	slopesensor_slopeid = noone;

	if (yadd == 0)
	    slopesensor_extendedcheck = 6; //The checking line will be longer when the player is not on air, to prevent him from not checking while moving.
	else
	    slopesensor_extendedcheck = 0;

	//The following applies to every "obj_slopeparent" in the room.
	//If you have too many instances of this object, the game will suffer slowdowns, so be sure to deactivate the ones that are far from the player. 
	with (obj_slopeparent) {
		
	    //Find the height of the slope at other's slopesensor_x. It will be used to put other on top of the slope.
	    mariopointinslope_y = (slope_y1) + ((slope_y2 - slope_y1) * (((other.x + other.slopesensor_x) - (slope_x1)) / (slope_x2 - slope_x1)))
    
	    if (((other.x + other.slopesensor_x) >= slope_x1
	    && (other.x + other.slopesensor_x) <= slope_x2
	    && slope_x2 > slope_x1) //If the player is inside the area of slope_x1 and slope_x2, and slope_x2 is higher than slope_x1.
    
	    || ((other.x + other.slopesensor_x) >= slope_x2
	    && (other.x + other.slopesensor_x) <= slope_x1
	    && slope_x2 <= slope_x1) ) //If the player is inside the area of slope_x1 and slope_x2, and slope_x1 is higher than slope_x2. (Though none of the slope objects in this example have their slope_x1 higher than slope_x2)
    
	    && ((other.y + other.slopesensor_y2 + other.slopesensor_extendedcheck) >= mariopointinslope_y) //If the bottom of other's checking line (slopesensor_y2) is lower than "mariopointinslope_y".
	    && (other.y + other.slopesensor_y1) <= mariopointinslope_y //If the top of other's checking line (slopesensor_y1) is higher than "mariopointinslope_y".
    
	    && other.yspeed >= -0.85 //Will only check for slopes when the player's vspeed is equal or higher than 0.
	        other.slopesensor_slopeid = id; //The ID of the slope found by other's checking line will be stored in "slopesensor_slopeid".
	}

	if (yspeed >= 0)
	&& (slopesensor_slopeid != noone)
	    y = (slopesensor_slopeid).mariopointinslope_y - slopesensor_y2; //Set other on top of the slope found by the "sensor line".
}
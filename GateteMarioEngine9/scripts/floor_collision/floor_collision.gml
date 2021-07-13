function mario_floor_collision() {

	floorsensor_floorid = noone;

	if (state < 2)
	    floorsensor_extendedcheck = 6; //The checking line will be longer when the player is not on air, to prevent him from not checking while moving.
	else
	    floorsensor_extendedcheck = 0;

	//The following applies to every "par_semisolid" in the room.
	//If you have too many instances of this object, the game will suffer slowdowns, so be sure to deactivate the ones that are far from the player. 
	with (par_semisolid) {
		
	    //Find the height of the floor at obj_mario's floorsensor_x. It will be used to put obj_mario on top of the floor.
	    mariopointinfloor_y = (floor_y1) + ((floor_y2 - floor_y1) * (((obj_mario.x + obj_mario.floorsensor_x) - (floor_x1)) / (floor_x2 - floor_x1)))
    
	    if (((obj_mario.x + obj_mario.floorsensor_x) >= floor_x1
	    && (obj_mario.x + obj_mario.floorsensor_x) <= floor_x2
	    && floor_x2 > floor_x1) //If the player is inside the area of floor_x1 and floor_x2, and floor_x2 is higher than floor_x1.
    
	    || ((obj_mario.x + obj_mario.floorsensor_x) >= floor_x2
	    && (obj_mario.x + obj_mario.floorsensor_x) <= floor_x1
	    && floor_x2 <= floor_x1) ) //If the player is inside the area of floor_x1 and floor_x2, and floor_x1 is higher than floor_x2. (Though none of the floor objects in this example have their floor_x1 higher than floor_x2)
    
	    && ((obj_mario.y + obj_mario.floorsensor_y2 + obj_mario.floorsensor_extendedcheck) >= mariopointinfloor_y) //If the bottom of obj_mario's checking line (floorsensor_y2) is lower than "mariopointinfloor_y".
	    && (obj_mario.y + obj_mario.floorsensor_y1) <= mariopointinfloor_y //If the top of obj_mario's checking line (floorsensor_y1) is higher than "mariopointinfloor_y".
    
	    && obj_mario.yspeed >= 0 //Will only check for floors when the player's vspeed is equal or higher than 0.
	        obj_mario.floorsensor_floorid = id; //The ID of the floor found by obj_mario's checking line will be stored in "floorsensor_floorid".
	}

	if (state < 2)
	&& (floorsensor_floorid != noone)
	    y = (floorsensor_floorid).mariopointinfloor_y - floorsensor_y2; //Set obj_mario on top of the floor found by the "sensor line".
}
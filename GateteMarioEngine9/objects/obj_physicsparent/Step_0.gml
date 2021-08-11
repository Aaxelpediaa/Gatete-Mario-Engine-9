/// @description Logic for NPCs

//Handle psuedo movement
x += xspeed;
y += yspeed;
yspeed += yadd;

//NPC Wall & Ceiling
ai_npc_wall(turn_toward);
ai_npc_ceiling(turn_toward_ceiling);

//Check if there's a collision below and if NPC is on the ground
if (collision_rectangle(bbox_left, bbox_bottom-2, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0)) 
|| (collision_rectangle(x-1, bbox_bottom-2, x+1, bbox_bottom+4, obj_slopeparent, 1, 0)) 
	yadd = 0; //Reset gravity
else {
	
	//Fall and reset bounces to whatever value depending on vertical acceleration caused by gravity
	bounces = min(bouncy, bounces + sign(yspeed > bounces+1));
	
	//Set up gravity
	if (swimming)
		yadd = 0.0375;
	else
		yadd = 0.15; 
} 

//Handle position when on a slope
if (yspeed >= 0) {
	
	//If there's a slope collision in-position
	if (collision_rectangle(x-1, bbox_bottom-2, x+1, bbox_bottom+4, obj_slopeparent, 1, 0)) {
		
		//Calculate slope position
		slope_collision();
		
		//Stop vertical movement
		yadd = 0;
		
		//Bounce
		bounces = (max(0, bounces - 1));
		if (bounces < 2)
			yspeed = -0.6 * bounces;
		else 
			yspeed = -yspeed / bouncy;		
	}
	
	//Check for any nearby ground collision
	var semisolid = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_semisolid, 0, 0);
	
	//If there's ground below and Mario is not moving upwards
	if (semisolid)
	&& (bbox_bottom < semisolid.yprevious + 5)
	&& (!collision_rectangle(x-1, bbox_bottom-2, x+1, bbox_bottom+1, obj_slopeparent, 1, 0)) {
		
		//Snap above the semisolid
		y = semisolid.y + floor(y-bbox_bottom-0.4);
	
		//Stop vertical movement
		yadd = 0;
		
		//Bounce
		bounces = (max(0, bounces - 1));
		if (bounces < 2)
			yspeed = -0.6 * bounces;
		else
			yspeed = -yspeed / bouncy;
	}
}

//Vspeed capacity
yspeed = min(4 - (swimming * 2), yspeed);

//Check for a nearby swimming surface
var water = collision_rectangle(bbox_left, y-1, bbox_right, y, obj_swim, 1, 0);
    
//If the NPC is not swimming and makes contact with a water surface
if ((noswim == false) && (!swimming) && (water)) {
        
    //Make the NPC swim.
    swimming = true;
	
    //Stop most horizontal movement
    xspeed = xspeed/2;
                
    //Stop vertical movement
    if (yspeed > 0)
        yspeed = 0;
}
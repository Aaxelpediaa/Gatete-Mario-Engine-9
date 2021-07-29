/// @description Fireball logic

//Check if the fireball is not moving
prevxspeed = xspeed;

//Handle psuedo movement
x += xspeed;
y += yspeed;
yspeed += yadd;

//NPC Wall & Ceiling
ai_npc_ceiling();
ai_npc_wall(false);

//Check if there's a collision below and if NPC is on the ground
if (collision_rectangle(bbox_left, bbox_bottom-2, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0)) 
|| (collision_rectangle(x-1, bbox_bottom-2, x+1, bbox_bottom+1, obj_slopeparent, 1, 0)) 
	yadd = 0; //Reset gravity
else {
	
	//Fall and reset bounces to whatever value depending on vertical acceleration caused by gravity
	yadd = 0.25; 
} 

//Handle position when on a slope
if (yspeed >= 0) {
	
	//If there's a slope collision in-position
	if (collision_rectangle(x-1, bbox_bottom-2, x+1, bbox_bottom+1, obj_slopeparent, 1, 0)) {
		
		//Calculate slope position
		slope_collision();
		
		//Bounce
		yspeed = -2.5;
		
	}
	
	//Check for any nearby ground collision
	var semisolid = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_semisolid, 0, 0);
	
	//If there's ground below and Mario is not moving upwards
	if (semisolid)
	&& (bbox_bottom < semisolid.yprevious+5)
	&& (!collision_rectangle(x-1, bbox_bottom-2, x+1, bbox_bottom+1, obj_slopeparent, 1, 0)) {
		
		//Snap above the semisolid
		y = semisolid.bbox_top-8;
	
		//Bounce
		yspeed = -2.5;
	}
}

//Vspeed capacity
if (yspeed > 4)
	yspeed = 4;
	
//Destroy when there's not horizontal speed
if (xspeed != prevxspeed)
	event_user(0);
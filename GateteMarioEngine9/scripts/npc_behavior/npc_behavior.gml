///LIST of npc_behavior

function ai_npc_wall(freezeuponwall) {
	
	//If moving right and there's a wall in position
	if (xspeed > 0)
	&& (collision_rectangle(bbox_right, bbox_top+1, bbox_right+1, bbox_bottom-4, obj_solid, 1, 0)) {
		
		//Stop horizontal movement or reverse movement
		xspeed = -(xspeed * freezeuponwall);
		
		//Prevent NPC from getting embed on the wall
		while (collision_rectangle(bbox_right, bbox_top+1, bbox_right, bbox_bottom-4, obj_solid, 1, 0))
			x--;
	}
	
	//Otherwise, if moving left
	else if (xspeed < 0)
	&& (collision_rectangle(bbox_left-1, bbox_top+1, bbox_left, bbox_bottom-4, obj_solid, 1, 0)) {	
		
		//Stop horizontal movement or reverse movement
		xspeed = -(xspeed * freezeuponwall);
		
		//Prevent NPC from getting embed on the wall
		while (collision_rectangle(bbox_left, bbox_top+1, bbox_left, bbox_bottom-4, obj_solid, 1, 0))
			x++;
	}
}

function ai_npc_ceiling() {
	
	//If moving upwards
	if (yspeed < 0) 
	&& (collision_rectangle(bbox_left-xspeed, bbox_top+yspeed-1, bbox_right-xspeed, bbox_top, obj_solid, 1, 0)) {
		
		//Prevent the NPC from getting stuck on a ceiling when jumping
		while (collision_rectangle(bbox_left-xspeed, bbox_top, bbox_right-xspeed, bbox_top, obj_solid, 1, 0))
			y++;
		
		//Stops rising
		yspeed = 0;
	}
}
/// @description Track logic

//Inherit event from obj_platform_track
event_perform_object(obj_platform_track, ev_step, ev_step_normal);

//Make collisions move along
if (platform != noone) {

	//Set the platform position
	platform.x = x - ((width * 16) / 2) + 8;
	platform.y = y + 12;
	
	//Set the left wall position
	if (wall_l != noone) {
		
		wall_l.x = platform.bbox_left;
		wall_l.y = y+28;
	}
	
	//Set the right wall position
	if (wall_r != noone) {
		
		wall_r.x = platform.bbox_right - 15;
		wall_r.y = y+28;
	}
}
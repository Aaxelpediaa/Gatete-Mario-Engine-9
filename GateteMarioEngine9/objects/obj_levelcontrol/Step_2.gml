/// @description Deals with various game logic stuff

//Make the camera follow this object
camera_set_view_target(view_camera[0], self);

//If Mario does exist
if (instance_exists(obj_mario)) {

	//Follow up Mario
	x = obj_mario.x;
	y = obj_mario.y;
	
	//If the barrier is active
	if (barrier == true) {
	
		//If Mario is at the left boundary
		if (obj_mario.x < camera_get_view_x(view_camera[0]) + 5) {
		
			obj_mario.x = camera_get_view_x(view_camera[0]) + 5;
			if (obj_mario.xspeed < 0)
				obj_mario.xspeed = 0;
		}
		else if (obj_mario.x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 5) {
			
			obj_mario.x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 5;
			if (obj_mario.xspeed > 0)
				obj_mario.xspeed = 0;			
		}
	}
}

//Round position
x = round(x);
y = round(y);
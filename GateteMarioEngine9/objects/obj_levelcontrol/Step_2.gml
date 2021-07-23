/// @description Deals with various game logic stuff

//Make the camera follow this object
camera_set_view_target(view_camera[0], self);

//If the player does exist
if (instance_exists(obj_mario)) {

	x = obj_mario.x;
	y = obj_mario.y;
}

//Round position
x = round(x);
y = round(y);
/// @description Deals with various game logic stuff

//If Mario does exist
if (instance_exists(obj_mario)) {

	//Follow up Mario
	x = obj_mario.x;
	y = obj_mario.y;
	
	//If the barrier is active
	if (barrier == true) {
	
		//If Mario is at the left boundary
		if (obj_mario.x < camera_get_view_x(view_camera[0]) + 5) {
			
			//If Mario is flying with the cape
			if (instance_exists(obj_fly)) {
			
				obj_fly.x = camera_get_view_x(view_camera[0]) + 5;
				if (obj_fly.xspeed < 0)
					obj_fly.xspeed = 0;
			}
		
			obj_mario.x = camera_get_view_x(view_camera[0]) + 5;
			if (obj_mario.xspeed < 0)
				obj_mario.xspeed = 0;
		}
		else if (obj_mario.x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 5) {
			
			//If Mario is flying with the cape
			if (instance_exists(obj_fly)) {
			
				obj_fly.x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 5;
				if (obj_fly.xspeed > 0)
					obj_fly.xspeed = 0;
			}
			
			obj_mario.x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 5;
			if (obj_mario.xspeed > 0)
				obj_mario.xspeed = 0;			
		}
	}
}

//Clamp Y
var shake_val = 0;

// If there is a camera shake to occur
if (shake_time > 0) {
	
	// If the shake falls off from it's original value
	if (shake_falloff) {
		
		// Calculate the shake value relative to the time left in the timer
		shake_val = shake_intensity * (shake_time / shake_starttime);
		
	} 
	else
	
		// Match shake value to shake intensity
		shake_val = shake_intensity;
	
	// Choose randomly between up and down shake
	shake_val = choose(-shake_val, shake_val);
	
	// Subtract shake time
	shake_time --;
	
} else {

	// Make sure the shake time & start time bottom out to 0
	shake_time = 0;
	shake_starttime = 0;	
}

//Clamp the X/Y position to the room so that shakes on the bottom of the screen still occur fine
x = screen_round(clamp(x, camera_get_view_width(view_camera[0])/2, room_width - camera_get_view_width(view_camera[0])/2)-(camera_get_view_width(view_camera[0])/2));
y = screen_round(clamp(y, camera_get_view_height(view_camera[0])/2, room_height - camera_get_view_height(view_camera[0])/2)-(camera_get_view_height(view_camera[0])/2));

//Ensure there is no view target so that the camera can be manually moved
camera_set_view_target(view_camera[0], noone);

//Set the camera position
camera_set_view_pos(view_camera[0], x, y+shake_val);

//Manage background position
#region PARALLAX BACKGROUNDS

	//Get both x and y position
	var cam_x = camera_get_view_x(view_camera[0]);
	var cam_y = camera_get_view_y(view_camera[0]);
		
	#region BACKGROUND 0
		
		#region POSITION SETUP
		
			//Get ID from "Background 0"
			var lay_id = layer_get_id("Background_0");
			
			//Get data from said layer
			var back_id = layer_background_get_id(lay_id);
			var back_spr = layer_background_get_sprite(back_id);

			//Horizontal parallax
			layer_x("Background_0", cam_x / 2);
			
			//Vertical parallax
			if (sprite_get_height(back_spr) < room_height)
			&& (sprite_get_height(back_spr) > camera_get_view_height(view_camera[0]))
				layer_y("Background_0", cam_y * (room_height - sprite_get_height(back_spr)) / (room_height -  camera_get_view_height(view_camera[0])));		
		
		#endregion
	
	#endregion
	
	//Background 1
	layer_x("Background_1", cam_x / 4);
	
	//Background 2
	layer_x("Background_2", cam_x / 6);
	
#endregion
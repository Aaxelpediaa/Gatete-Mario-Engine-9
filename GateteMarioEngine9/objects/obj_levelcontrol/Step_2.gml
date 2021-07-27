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

//Manage background position
#region PARALLAX BACKGROUNDS

	//Get both x and y position
	var cam_x = camera_get_view_x(view_camera[0]) + layer_get_hspeed("Background 0");
	var cam_y = camera_get_view_y(view_camera[0]);
		
	#region BACKGROUND 0

		//Get layer ID and sprite
		var lay_id = layer_get_id("Background 0");
		var lay_spr = layer_background_get_sprite(lay_id);
		
		#region POSITION SETUP
		
			//Get the height of the sprite obtained in lay_spr
			var lay_height = sprite_get_height(lay_spr);
	
			//Set x position of "Background_0" layer
			layer_x("Background_0", cam_x / 2);
		
			//Set y position of "Background 0" layer
			if (lay_height < room_height)
			&& (lay_height > camera_get_view_height(view_camera[0]))
				layer_y("Background_0", cam_y * (room_height - lay_height) / (room_height -  camera_get_view_height(view_camera[0])));
		
		#endregion
	
	#endregion
	
	//Background 1
	layer_x("Background_1", cam_x / 4);
	
	//Background 2
	layer_x("Background_2", cam_x / 6);
	
#endregion


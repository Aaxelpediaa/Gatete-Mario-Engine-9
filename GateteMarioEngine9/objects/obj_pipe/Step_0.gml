/// @description Break blocks if Mario is giant

//Check for Mario
var mario = collision_rectangle(bbox_left-4, bbox_top, bbox_right+4, bbox_bottom, obj_mario, 0, 0);

//If Mario does exist
if (mario)
&& (global.powerup == cs_mega) {
	
	//If the pipe is not broken, break it.
	if (broken == 0) {
	
		//Mark pipe as broken
		broken = 1;
		
		//Check horizontal speed
		hsp = mario.xspeed;
				
		//Create broken pipe
		pipe = instance_create_depth(x + sprite_width / 2, y + sprite_height / 2, depth - 1, obj_pipe_broken);
		with (pipe) {
			
			//Horizontal speed
			hspeed = other.hsp;
			
			//Height
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
		}

		//Destroy solid mask
		with (mysolid) instance_destroy();
	}
}
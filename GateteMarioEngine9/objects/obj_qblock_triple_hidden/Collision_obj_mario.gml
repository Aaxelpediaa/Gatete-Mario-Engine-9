/// @description If Mario jumps from below, reveal block

//If Mario's vertical speed is lower than 0
if (other.yspeed < 0)
&& (other.bbox_top > bbox_bottom+other.yspeed) {

	//Create a new block, give it the same item and bump it.
	with (instance_create_depth(x, y, 9, obj_qblock_triple)) {
		
		//Set the item to reveal
		sprout[0] = other.sprout[0];
		sprout[1] = other.sprout[1];
		sprout[2] = other.sprout[2];
	
		//Set state to bumped
		ready = 1;
						
		//Set horizontal speed
		vspeed = -2;
		alarm[0] = 4;
						
		//Create block specific events
		event_user(0);		
	}
	
	//Destroy
	instance_destroy();
}
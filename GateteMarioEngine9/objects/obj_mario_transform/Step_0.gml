/// @description Set special grow state

if (sequence == 5) {

	//Increment scale
	scale += 0.0375;
	
	//Manage scale
	if (scale > 0) {
		
		//If the scale is greater than 4
		if (scale > 4) {
		
			//Set scale to 4
			scale = 4;

			//Destroy the sprite
			sprite_delete(snapshot);
		
			//Activate all instances
			instance_activate_all();
        
	        //With the player
	        with (obj_mario) {
        
	            //Enable gravity
	            enable_gravity = true;
            
	            //Make visible
	            visible = true;
            
	            //Set alpha back to 1, but check first if the player is not doing a special action.
	            if (instance_exists(obj_puller))
	            || (instance_exists(obj_spinner))
	            || (instance_exists(obj_dropdown))
	            || (instance_exists(obj_wallrunner))
	                image_alpha = 0;
	            else
	                image_alpha = 1;
	        }
        
	        //Destroy
	        instance_destroy();
		}
		
		//Set up frame
		if (scale > 1.75)
			image_index = 1;
		if (scale > 2.5)
			image_index = 2;
		if (scale > 3.25)
			image_index = 3;
	}
}
/// @description Block logic

//Upon getting hit
switch(seq) {
	
	//Alarms suck lol
	case(1): {
		
		//Exclude block from frozen screenshot
		visible = false;
		seq = 2; break;
	}
	case(2): {
		
		//Freeze
		freeze_create();
		instance_activate_object(self);
		seq = 3; break;
	}
	case(3): {
		
		//Jump
		var grav = 0.1;
		vspeed = -4;
		gravity = grav;

		//Calculate horizontal trajectory
		var traj = round((camera_get_view_x(view_camera[0]) + 42) - x)
		hspeed = (traj / ((-1 * 2 * vspeed) / grav))

		//Now appear on the sequence
		visible = true;
		seq = 0;
		break;
	}
}

//If gravity is ever activated 
if (gravity <> 0) {
	
	//Plummet to where it splits open
	if (y > camera_get_view_y(view_camera[0]) + global.gh - 30) {
		
		//Destroy the sprite
		sprite_delete(snapshot);
		
		//Activate all instances
		instance_activate_all();
		
		//Smoke
		for (var i = 0; i < 3; i++)
			instance_create_depth(camera_get_view_x(view_camera[0]) + 12 + (i * 16), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16, -32, obj_smoke)
		
		//Collect Mode
		with (obj_hud) collect_mode = other.coins;
		
		//Destroy this object
		instance_destroy();
	}
}


//Break blocks if Mario is giant

//If the block is animating, exit
if (image_speed > 0)
exit;

//Check for Mario
var mario = collision_rectangle(bbox_left-4, bbox_top-8, bbox_right+4, bbox_bottom+4, obj_mario, 0, 0);

//If Mario does exist
if (mario) {

	//and Mario is not small, exit
	if (global.powerup == cs_tiny)
	|| (global.powerup == cs_small)
		exit;
		
	//If Mario is big, or it's big or has the mega mushroom
	else if ((global.powerup > cs_small) && (global.powerup != cs_propeller) && (mario.yspeed > 0) && (mario.jumpstyle == 1))
	|| (global.powerup == cs_mega)
	|| ((global.powerup == cs_propeller) && (mario.yspeed > 0) && ((input_check(input.down) || (gamepad_axis_value(0, gp_axislh) > 0.5)))) {
		
		//Break the block
		event_user(15);
		
		//Jump a little if Mario is not drilling or has the mega mushroom
		if (global.powerup != cs_mega) 
		&& (global.powerup != cs_propeller)
			with (mario) event_user(1);
	}
}
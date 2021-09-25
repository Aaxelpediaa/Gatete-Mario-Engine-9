/// @description Break blocks if Mario is giant

//If the block is animating, exit
if (image_speed > 0)
exit;

var mario = collision_rectangle(bbox_left-6, bbox_top-8, bbox_right+6, bbox_bottom+8, obj_mario, 0, 0);

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
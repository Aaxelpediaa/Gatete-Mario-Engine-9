/// @description Break blocks if Mario is giant

//Check for Mario
var mario = collision_rectangle(bbox_left-4, bbox_top-4, bbox_right+4, bbox_bottom+4, obj_mario, 0, 0);

//If Mario does exist
if (mario) 
&& (global.powerup == cs_mega)
	event_user(15);
/// @description Superball logic

//No swimming
swimming = false;

//Inherit event
event_inherited();

//No gravity
if (yadd == 0) {

	yspeed = -3;
	yadd = 0;
}
else
	yadd = 0;
	
//Check for ceiling
var ceiling = collision_rectangle(bbox_left+xspeed, bbox_top+yspeed, bbox_right+xspeed, bbox_top+yspeed, obj_solid, 1, 0);
if (ceiling)
|| (collision_rectangle(bbox_left+xspeed, bbox_top+yspeed, bbox_right+xspeed, bbox_top+yspeed, obj_slopeparent, 1, 0)) {

	xspeed = -xspeed;
	yspeed = -yspeed;
}
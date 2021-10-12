/// @description Red Ring

/*
//	This object uses creation code
//
//	ring_id = Ring ID
//	sprout = Use macro list (Must be equal or higher than 0
*/

//Default value
ring_id = 0;
sprout = cs_fire;

//Scale
scale = 1;

//Destroy if this ring was collected before
if (ds_map_find_value(global.redrings, id)) {

	instance_destroy();
	exit;
}
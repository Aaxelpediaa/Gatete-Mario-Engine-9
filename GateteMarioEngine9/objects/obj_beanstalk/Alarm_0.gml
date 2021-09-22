/// @description Allow creation of new vines

//Snap to the grid
move_snap(1, 16);

//Create a vine
with (instance_create_depth(x - 8, y, 12, obj_vine)) {

	image_speed = 0;
	image_index = 0;
}

//Repeat
alarm[0] = 16;
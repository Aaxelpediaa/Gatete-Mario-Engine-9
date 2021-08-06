/// @description Begin timer

//Begin timer
if (coiny == 0) {

	coiny = 1;
	alarm[2] = 240;
}

//Create coin
instance_create_depth(x + 8, ystart - 16, -4, obj_block_coin);
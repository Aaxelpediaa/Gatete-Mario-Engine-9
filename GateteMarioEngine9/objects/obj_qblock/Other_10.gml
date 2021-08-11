/// @description Make a coin come out if no item was selected

if (sprout == cs_coin)
	instance_create_depth(x + 8, ystart - 16, -4, obj_block_coin);
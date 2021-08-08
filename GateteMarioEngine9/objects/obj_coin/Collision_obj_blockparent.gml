/// @description Collect the coin

if (other.vspeed < 0) {
	
	instance_create_depth(x + 8, ystart - 16, -4, obj_block_coin);
	instance_destroy();
	exit;
}
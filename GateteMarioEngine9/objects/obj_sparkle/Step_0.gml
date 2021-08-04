/// @description Shrink down and destroy

scale -= shrink_rate;
if (scale < 0)
	instance_destroy();
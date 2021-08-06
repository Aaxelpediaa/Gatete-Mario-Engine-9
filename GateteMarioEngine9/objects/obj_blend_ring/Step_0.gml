/// @description Vanish when scale is over 0.5

scale += 0.0324;
if (scale > 0.5) {

	alpha -= 0.05;
	if (alpha < 0.05)
		instance_destroy();
}
/// @description Manage effect

//Set up xscale, yscale
image_xscale = scale;
image_yscale = scale;

//Increment scale
scale += 0.05;
if (scale > 0.5) {

	alpha -= 0.05;
	if (alpha < 0.05)
		instance_destroy();
}
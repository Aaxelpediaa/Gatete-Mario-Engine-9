/// @description Create semisolid

with (instance_create_layer(x, y, "Main", obj_semisolid)) {
	
	visible = false;
	image_xscale = other.image_xscale;
}
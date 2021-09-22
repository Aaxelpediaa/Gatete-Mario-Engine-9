/// @description Get extra life

//Get an extra life
with (instance_create_depth(x, y, -6, obj_score)) value = -1;

//Create effect
with (instance_create_depth(x, y+8, -6, obj_blend_ring)) {
	
	beam = true;
	image_blend = c_lime;
}

//Destroy
instance_destroy();
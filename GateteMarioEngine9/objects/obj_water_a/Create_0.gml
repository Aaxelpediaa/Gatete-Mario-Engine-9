/// @description Water

//Set depth
depth = 400;

//Create swimming collision based on size
with (instance_create_layer(x, y, "Main", obj_swim)) {

	image_xscale = other.sprite_width/16;
	image_yscale = other.sprite_height/16;
}
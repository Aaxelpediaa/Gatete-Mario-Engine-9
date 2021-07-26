/// @description The level controller

/*
**  This item uses creation code!
**
**  bg_index = Background to replace.
**  bg_frame[0 ... 99] = Background frames.
*/

//Set depth
depth = 10000;

//Barrier
barrier = false;
alarm[6] = 3;

//Create HUD
instance_create_layer(0, 0, "GUI", obj_hud);
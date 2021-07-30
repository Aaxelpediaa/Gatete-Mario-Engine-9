/// @description Finish block bump

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Make an item come out if there's one
if (sprout != cs_coin) {
	
}

//Turn into a used block
instance_change(obj_emptyblock, false);
/// @description Finish block bump

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Turn into a used block
if (coiny == 2)
	instance_change(obj_emptyblock, false);
else
	ready = 0;
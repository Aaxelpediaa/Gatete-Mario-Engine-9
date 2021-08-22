/// @description Enemies, Holdable items, or Misc

//Pseudo variables
xspeed = 0;
yspeed = 0;
yadd = 0;

//Facing directions
xscale = 1;
yscale = 1;

//Swimming?
swimming = false;

//Bounce coefficient (zero or any # to determine bounce strength)
bouncy = 2;
bounces = 2;

//Slope sensors
slopesensor_x = 0;
slopesensor_y1 = 8;
slopesensor_y2 = 16;
slopesensor_extendedcheck = 0;
slopesensor_slopeid = noone;

//Depth
depth = -2;

//Change gravity when in contact with water
noswim = false;


//Turn towards walls?
//-1: Jump them
//0: Stop
//1: Turn around
turn_toward = 1;

//Turn towards ceilings
turn_toward_ceiling = false;

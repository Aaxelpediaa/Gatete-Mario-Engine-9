/// @description The level controller

/*
**  This item uses creation code!
**
**  inisection      = The music section to read from the INI file
**  leveltime       = The time limit in seconds (Optional)
**  camlock         = To lock the camera in position
**  makeswim        = To make the entire level swimable
*/

//Default values
inisection = "Overworld";
leveltime = 0;
camlock = 0;
makeswim = 0;

//Play music
alarm[0] = 2;

//Level music
levelmusic = noone;

//Is music disabled?
musicdisable = 0;

//Set depth
depth = 10000;

//Barrier
barrier = false;
alarm[6] = 3;

//Object to follow
follow = noone;

//P-Switch variables
pswitchon = false;
pswitch_warn = false;

//Gray P-Switch variables
sswitchon = false;
sswitch_warn = false;

//Reach last ground Y
floorY = 0;

//Create HUD
instance_create_layer(0, 0, "GUI", obj_hud);

//Shake variables
shake_intensity = 0;
shake_time = 0;
shake_falloff = 0;

//Used for calculating falloff
shake_starttime = 0;

//Underwater init
alarm[8] = 2;
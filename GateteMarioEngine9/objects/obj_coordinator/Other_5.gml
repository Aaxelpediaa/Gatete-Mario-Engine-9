/// @desc Destroy the non-persistent timers and fade to black

//Destroy non-persistent timers
timer_system_room_end();

//Fade to black
mode = 1;

//Set the pixel size
size = 0;

//Take a screenshot
back = sprite_create_from_surface(application_surface, 0, 0, global.gw*2, global.gh*2, 0, 0, 0, 0);

//Set alarm to execute when the next room starts
alarm[4] = 1;
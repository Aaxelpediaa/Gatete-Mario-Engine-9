/// @description Set motion

//Jump
var grav = 0.1;
vspeed = -4;
gravity = grav;

//Calculate horizontal trajectory
var traj = round(camera_get_view_x(view_camera[0]) + 38) - x;
hspeed = (traj / ((-1 * 2 * vspeed) / grav));

//Delay visibilitiy
alarm[1] = 2;
/// @desc Stay always in front and update timers

//Update Window Caption
window_set_caption("Gatete Mario Engine 9 | FPS: " + string(fps) + " / 60")

//Update controller button graphics
gui_buttons = gamepad_set_gui_sprite();

//Stay always at the front
depth = -1000;

//Update all timers
timer_system_update();

//Prevent lives from going over 99
if (lives > 99) 
	lives = 99;
	
//Prevent score from going over 99999990
if (score > 99999990) 
	score = 99999990;
/// @desc Stay always in front and update timers

//Update Window Caption
window_set_caption("Gatete Mario Engine 9 | FPS: " + string(fps) + " / 60)")

//Stay always at the front
depth = -1000;

//Update all timers
timer_system_update();
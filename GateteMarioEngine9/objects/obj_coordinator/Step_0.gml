/// @desc Stay always in front and update timers

//Update Window Caption
window_set_caption("Gatete Mario Engine 9 | FPS: " + string(fps) + " / 60)")

//Update controller button graphics
gui_buttons = gamepad_set_gui_sprite();

//Stay always at the front
depth = -1000;

//Update all timers
timer_system_update();

//Prevent score and lives from going over 99
if (lives > 99) then lives = 99;
if (score > 99999990) then score = 99999990;

//Temporary keys
#region TEMPORARY CHANGES

	//Swap subpixel modes
	if (keyboard_check_pressed(ord("0")))
		global.subpixels = !global.subpixels;

	//Swap powerups
	if (keyboard_check_pressed(vk_add)) {

		global.powerup++;
		if (global.powerup > cs_mega)
			global.powerup = cs_mega;
	}
	else if (keyboard_check_pressed(vk_subtract)) {

		global.powerup--;
		if (global.powerup < cs_tiny)
			global.powerup = cs_tiny;
	}
#endregion
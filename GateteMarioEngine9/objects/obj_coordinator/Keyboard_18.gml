/// @description Restart the game when both ALT+R are pressed

if (keyboard_check_pressed(ord("R"))) {

	//Stop playing all sounds
	audio_stop_all();
	
	//Reset global variables
	init_globals();
	
	//Go to the title screen
	room_restart();
}
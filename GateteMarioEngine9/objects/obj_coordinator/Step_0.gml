/// @desc Stay always in front and update timers

//Update Window Caption
window_set_caption("Gatete Mario Engine 9 | FPS: " + string(fps) + " / 60")

//Update controller button graphics
gui_buttons = gamepad_set_gui_sprite();

//Update all timers
timer_system_update();

//Stay always at the front
depth = -1000;

//Award extra lives every 100 coins
if (global.coins > 99) {

	//Restart coin counter
	global.coins -= 100;
	
	//If the game is still giving extra lives
	if (addlives == 0) {
			
		//Play '1-UP' sound
		audio_play_sound(snd_1up, 0, false);
		
		//Add extra lives
		lives++;
	}
	else
		addlives++;
}

//Prevent lives from going over 99
if (lives > 99) 
	lives = 99;
	
//Prevent score from going over 99999990
if (score > 99999990) 
	score = 99999990;
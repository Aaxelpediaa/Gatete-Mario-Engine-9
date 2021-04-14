///input_check_released(enum);

/*
**  Usage:
**      input_check_released(enum);
**
**  Given:
**      enum = The key enum (Check obj_coordinator for a full list)
**
**  Purpose:
**      Check if the given input is being released and return the result
*/

function input_check_released(_enum) {

	var _gamepad;
	var _keyboard = keyboard_check_released(global.key[argument[0]]);
	
	//Go through all connected gamepads
	for (i=0; i<gamepad_get_device_count(); i++) {
	
		_gamepad += gamepad_button_check_released(i, global.button[argument[0]]);
	}
	
	return _keyboard+_gamepad;
}
///input_check(enum);

/*
**  Usage:
**      input_check(enum);
**
**  Given:
**      enum = The key enum (Check obj_coordinator for a full list)
**
**  Purpose:
**      Check if the given input is being held down and return the result
*/

function input_check(_enum) {

	var _gamepad;
	var _keyboard = keyboard_check(global.key[argument[0]]);
	
	//Go through all connected gamepads
	for (i=0; i<gamepad_get_device_count(); i++) {
	
		_gamepad += gamepad_button_check(i, global.button[argument[0]]);
	}
	
	return _keyboard+_gamepad;
}
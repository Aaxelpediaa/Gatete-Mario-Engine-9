/// @function input_check_pressed(enum);
/// @param {_enum} The key enum to check

function input_check_pressed(_enum) {

	var _gamepad;
	var _keyboard = keyboard_check_pressed(global.key[argument[0]]);
	
	//If there's a gamepad connected
	if (gamepad_is_connected(0)) {
	
		//Check if the button to check is pressed
		_gamepad = gamepad_button_check_pressed(0, global.button[argument[0]]);
	}
	
	return _keyboard + _gamepad;
}
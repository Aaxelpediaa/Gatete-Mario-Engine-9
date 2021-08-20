/// @description audio_loop_sound(sound, sample_begin, sample_end, priority)
/// @param sound
/// @param sample_begin
/// @param sample_end
/// @param priority

function audio_loop_sound() {

	var _als = instance_create_depth(16, 16, -1000, obj_audio_loop_sound)
	with (_als) {

	    _audio = audio_play_sound(argument[0], argument[3], true);
	    _loop_begin = argument[1];
	    _loop_end = argument[2];
	    _transition_delay = 0.05; //<[Custom]
	    _debug = 0;
	}
	return _als._audio;
}
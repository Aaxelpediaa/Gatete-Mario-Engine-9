/// @description A boomerang thrown by Mario

//Loop 'Boomerang' sound
if (!audio_is_playing(snd_boomerang)) {
	
	audio_play_sound(snd_boomerang, 0, true);
}

//Inherit event from parent
event_inherited();

//No gravity
gravity = 0;

//Allows boomerang to be picked up after is thrown
canpick = 0;

//Handle movement
ready = 0;
ready2 = 0;
ready3 = 0;

//Thrower id
parent = -1;

//Go up
alarm[0] = 32;

//Horizontal scale
xscale = 1;

//Angle
angle = 0;

//Set the vertical speed
vspeed = -0.75;
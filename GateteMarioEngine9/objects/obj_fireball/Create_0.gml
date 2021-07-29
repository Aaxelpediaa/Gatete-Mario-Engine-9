/// @description A fireball shot by Mario

//Inherit event from parent
event_inherited();

//Play 'Fireball' sound
audio_play_sound(snd_fireball, 0, false);

//Set vertical speed
yspeed = 4;

//No bounces
bouncy = 0;
bounces = 0;

//Do not swim
noswim = true;

//Do not turn toward walls
turn_toward = false;
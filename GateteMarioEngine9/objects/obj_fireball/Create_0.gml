/// @description A fireball shot by Mario

//Inherit event from parent
event_inherited();

//Play 'Fireball' sound
audio_play_sound(snd_fireball, 0, false);

//Set vertical speed
yspeed = 0.5;
/// @description Change P-Meter frame

if (obj_mario.pmeter < 144) {
	
	flash = 0;
	alarm[0] = 1;
}
else {
	
	flash = !flash;
	alarm[0] = 7;
}
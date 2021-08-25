/// @description Mario is evolving, ok no :)

//Sets the animation to reproduce.
//0: Small to big
//1: Big to small
//2: Powerup
//3: Powerdown
//4: Poof
//5: Mega Grow
//6: Mega Shrink
sequence = 0;

//Scale
scale = 1;

//Sets and starts the animation sequences.
ready = 0;

//How many times does the animation loop?
loop = 0;

//Destroy these objects first
with (obj_spinner) instance_destroy();
with (obj_dropdown) instance_destroy();
	
//Hereby Mario's colour
isflashing = obj_mario.isflashing;
    
//Hereby Mario's facing direction.
direct = obj_mario.xscale;
	
//Hide player elements
with (obj_cape) visible = false;
with (obj_wallrunner) visible = false;

//Make Mario invisible
if (instance_exists(obj_mario)) {
	
	//Set the sprite
	sprite_index = obj_mario.sprite_index;

	//Make Mario invisible.
	obj_mario.visible = 0;
    
	//Snap to position.
	x = round(obj_mario.x);
	y = round(obj_mario.y);
    
	//Set the depth
	depth = obj_mario.depth;    
}

//Create screenshot
freeze_create();

//Begin animation
alarm[0] = 1;
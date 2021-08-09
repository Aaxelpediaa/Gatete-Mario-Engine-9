/// @description Mario is evolving, ok no :)

//Sets the animation to reproduce.
//0: Small to big
//1: Big to small
//2: Powerup
//3: Powerdown
//4: Poof
sequence = 0;

//Sets and starts the animation sequences.
ready = 0;

//How many times does the animation loop?
loop = 0;

//Background
back = -1;

//Make Mario invisible
if (instance_exists(obj_mario)) {

    //Make Mario invisible.
    obj_mario.visible = false;
    
    //Snap to position.
    x = round(obj_mario.x);
    y = round(obj_mario.y);
    
    //Set the depth
    depth = obj_mario.depth;
    
    //Hereby Mario's colour
    isflashing = obj_mario.isflashing;
    
    //Hereby Mario's facing direction.
    image_xscale = obj_mario.xscale;    
}
	
//Make cape invisible
if (instance_exists(obj_cape))
	with (obj_cape) visible = false;

//Make spinner invisible
if (instance_exists(obj_spinner))
    with (obj_spinner) visible = false;

//Make dropdown invisible
if (instance_exists(obj_dropdown))
    with (obj_dropdown) visible = false;

//Make wallrunner invisible
if (instance_exists(obj_wallrunner))
    with (obj_wallrunner) visible = false;

//Start animation
alarm[0] = 1;
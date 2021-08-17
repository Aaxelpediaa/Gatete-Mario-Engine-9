/// @description Mario is evolving, ok no :)

//Sets the animation to reproduce.
//0: Small to big
//1: Big to small
//2: Powerup
//3: Powerdown
//4: Poof
sequence = 0;

//Scale
scale = 1;

//Sets and starts the animation sequences.
ready = 0;

//How many times does the animation loop?
loop = 0;

//Screenshot
snapshot = -1;

//Destroy these objects first
with (obj_spinner) instance_destroy();
with (obj_dropdown) instance_destroy();

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
    direct = obj_mario.xscale;    
}

//Make objects invisible
with (obj_cape) visible = 0;
with (obj_wallrunner) visible = 0;
with (obj_effectsparent) visible = 0;
with (obj_water_front) visible = 0;

//Freeze all NPCs
with (obj_physicsparent) event_user(14);

//Start animation
alarm[0] = 1;
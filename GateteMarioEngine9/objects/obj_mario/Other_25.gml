/// @description Reset variables after landing

//Enable gravity
disablegrav = 0;

//Reset bee flight
beefly = 0;

//Allow the player to jump again
jumping = 0;

//Reset spin jump variable
jumpstyle = 0;

//Reset the wall kick
wallkick = 0;

//Reset the cat climb time
catclimbing = 0;

//Reset combo variable if not sliding
if (!sliding)
    hitcombo = 0;
///Gatete Mario Engine 9 Controller Object (This is required for the game to run, do not remove it.)

//Initialize palette system


//Initialize global variables
#region GLOBAL GAME VARIABLES

//World Number
global.world = 1;

//Level ID (Used for star coin management)
global.level = 0;

//How many level does the game have? 
//(Make sure is 1 number higher than the amount of levels)
global.levelmax = cs_levels;

//Exits found
global.exits = ds_map_create();
global.exits2 = ds_map_create();

//Level Time
global.timer = 0;

//Level Skin
global.skin = 0;

//Lives
lives = 5;

//Score
score = 0;

//Coins
global.coins = 0;

//Red Coins
global.coins_red = 0;

//Silver Coins
global.coins_silver = 0;

//Display 'Mario Start!' text
global.mariostart = 0;

//Checks whether a level is cleared
//0: No clear
//1: Clear
//2: Clear (Secret Exit)
//3: Clear (Exit from side)
global.clear = 0;

//SMB3 Card System
global.card[0] = -1;
global.card[1] = -1;
global.card[2] = -1;

//Berries
global.berries = 0;

//Cherries
global.cherries = 0;

//Powerup
global.powerup = cs_small;

//Reserve item
global.reserve = cs_small;
global.reservedrop = true;

//Checkpoint
global.checkpoint = noone;

//Checkpoint Room
global.checkpointroom = noone;

//Fireworks
global.fireworks = 0;

//Switch Palaces
global.palace_y = 0;
global.palace_g = 0;
global.palace_r = 0;
global.palace_b = 0;

//ON / OFF Block
global.on_off_block = 0;

//Position change object type
//-1: No Change
//0: Mario
//1: Pipe
//2: Jump
//3: Climb
global.postchange = -1;

//Mount
//0: No mount
//1: Yoshi
//2: Kuribo Shoe
global.mount = 0;

//Mount colour
//0: Green
//1: Red
//2: Yellow
//3: Blue
//4: Teal
//5: Pink (Does not affect Kuribo shoes, only Yoshi)
global.mountcolour = 0;

//P-Switch time limit
global.pswitch = 0;

//G-Switch time limit
global.gswitch = 0;

//Star time limit
global.starman = 0;

//Star used in map?
global.mapstar = 0;

//Mushroom house prizes
global.prize[0] = 0;
global.prize[1] = 0;
global.prize[2] = 0;

//Map pipe area type
global.pipetype = 0;

//Data structure for opened doors
global.doors = ds_map_create();

//Data structure for collected ace coins
global.acecoins = ds_map_create();

//Data structure for collected red coin rings
global.redrings = ds_map_create();

//Item that is being carried between rooms
global.carrieditem = noone;

//The sprite used by an item carried between rooms
global.carriedsprite = noone;

//The object to return when carrying a SMB2 enemy between rooms
global.turnback = 0;

//Initialize star coin system
//0: Not collected
//1: Collected, not saved
//2: Collected, saved with checkpoint
//3: Collected, saved with level completion. (Adds to global.sc_count)
for (var i = 0; i < 3; i++) {

    global.sc[i] = ds_map_create();
    for (var j = 0; j < global.levelmax; j++)
        ds_map_add(global.sc[i],j,0);
}

//Star Coins collected
global.starcoins = 0;

//Data structure for storing the state of the world map.
global.mapscreen = ds_map_create();

//Map inventory variables
for (var i=0; i<13; i++) {

    global.inventory[i] = 0;
}
    
//100% game completion variable
global.gameclear = 0;

#endregion

//Gameplay variables
#region GAMEPLAY VARIABLES

//Turn enemies into coins when hit with a fireball
//0: Disabled
//1: Enabled
global.enemy_to_coin = 0;

//Flight time (In seconds, how much time allow Mario to fly as Raccoon/Tanooki Mario)
global.flighttime = 4;

//Climb time (In seconds, how much time allow Mario to climb walls as Cat Mario)
global.cattime = 3;

#endregion

//Current File
global.file = 0;

//Game Width
global.gw = 384;

//Game Height
global.gh = 216;
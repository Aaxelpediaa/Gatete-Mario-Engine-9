///Gatete Mario Engine 9 Game Coordinator (This is required for the game to run, do not remove it.)

//Initialize palette system
/* UNDER CONSTRUCTION */

//Initialize global variables
#region GLOBAL GAME VARIABLES

//World Number
global.world = "1";

//Level Number
global.level = "1";

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

//Safeguard
global.safeguard = 0;

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

//Initialize star coin system (Replace '999' with the amount of levels your game will have)
//0: Not collected
//1: Collected, not saved
//2: Collected, saved with checkpoint
//3: Collected, saved with level completion. (Adds to global.sc_count)
for (var i = 0; i < 3; i++) {

    global.sc[i] = ds_map_create();
    for (var j = 0; j < 999; j++)
        ds_map_add(global.sc[i], j, 0);
}

//Star Coins collected
global.starcoins = 0;

//Data structure for storing the state of the world map.
global.mapscreen = ds_map_create();

//Map inventory variables
for (var i=0; i<15; i++) {

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

//Allow reserve of items if enabled
global.reservedrop = true;

#endregion

//Powerup Macros
#region POWERUP MACROS

	#macro cs_tiny 0;
	#macro cs_small	1;
	#macro cs_big 2;
	#macro cs_fire 3;
	#macro cs_ice 4;
	#macro cs_carrot 5;
	#macro cs_raccoon 6;
	#macro cs_cape 7;
	#macro cs_frog 8;
	#macro cs_tanooki 9;
	#macro cs_hammer 10;
	#macro cs_boomerang	11;
	#macro cs_superball 12;
	#macro cs_shell	13;
	#macro cs_bee 14;
	#macro cs_volt 15;
	#macro cs_penguin 16;
	#macro cs_propeller 17;
	#macro cs_bell 18;
	#macro cs_football 19;
	#macro cs_ranger 20;
	#macro cs_squirrel 21;
	#macro cs_hare 22;
	#macro cs_gold 23;
	#macro cs_mega 24;

#endregion

//Item Macros
#region ITEM MACROS

	#macro cs_billy -27;
	#macro cs_beanstalk -26;
	#macro cs_propellerblock -25;
	#macro cs_trampoline -24;
	#macro cs_sswitch -23;
	#macro cs_pswitch -22;
	#macro cs_starman -21;
	#macro cs_3up -20;
	#macro cs_1up -19;
	#macro cs_lifeshroom -18;
	#macro cs_shoe_pentaro -17;
	#macro cs_shoe_jugemu -16;
	#macro cs_shoe_dossun -15;
	#macro cs_shoe_baburu -14;
	#macro cs_shoe_kuribo -13;
	#macro cs_yoshi_p -12;
	#macro cs_yoshi_t -11;
	#macro cs_yoshi_b -10;
	#macro cs_yoshi_y -9;
	#macro cs_yoshi_r -8;
	#macro cs_yoshi_g -7;
	#macro cs_area_b -6;
	#macro cs_area_r -5;
	#macro cs_area_g -4;
	#macro cs_area_y -3;
	#macro cs_coin_s -2;
	#macro cs_coin -1;
	
#endregion

//Current File
global.file = 0;

//Game Width
global.gw = 384;

//Game Height
global.gh = 216;

//Font Variables
/* UNDER CONSTRUCTION */

//Data structure for picked up 3up moons
global.moons = ds_map_create();

//Disable application surface automatic drawing
application_surface_draw_enable(false);

//Set up epsilon for floating point numbers
math_set_epsilon(0.0001);
/// @description It's a me, Mario!

//Enable / disable gravity
enable_gravity = false;

//Enable / disable control
enable_control = true;

//Enable / disable invincibility
//0: Disabled
//1: Enabled
//-1: Phase through
invulnerable = 0;

//Custom movement 
xspeed = 0;
yspeed = 0;
xadd = 0;
yadd = 0;

//Handle Mario's current state
//0: Idle
//1: Walk
//2: Jump
//3: Climb
state = 0;
statedelay = 0;

//Handle Mario's horizontal scale
//1: Right
//-1: Left
xscale = 1;

//Handle Mario's direction when stuck in a wall
//1: Right
//-1: Left
walldir = 1;
walldir2 = 0;

//Handle Mario's holding state
//0: No holding
//1: Front (SMB3 / SMW)
//2: Overhead (SMB2)
//3: Boomerang (SMA4)
//4: On Yoshi / Kuribo Shoe
holding = 0;

//Handle Mario's jumping state
//0: Can jump
//1: Variable jump
//2: No variable jump
jumping = 0;

//Handle Mario's jumping type
//0: Normal jump
//1: Spin Jump
jumpstyle = 0;

//Plays a sound when Mario is climbing or swimming with the frog suit
noisy = 0;

//Makes Mario run slightly faster (P-Meter)
running = 0;

//Makes Mario perform a slide animation or turn when holding something
turning = 0;

//Makes Mario able to swim
swimming = 0;

//Makes Mario able to butt-slide slopes
sliding = 0;

//Makes Mario able to fly
flying = 0;
flyfix = 0;

//Makes Mario able to crouch down
crouch = 0;

//Makes Mario hit a climbable net
netsmack = 0;

//Makes Mario able or not able to move
allow_move = 1;

//Handle P-Meter
pmeter = 0;
pready = 0;

//Makes Mario do a special animation when kicking / throwing items
kicking = 0;

//Checks if Mario is stuck on a solid surface.
inwall = false;

//Makes Mario do a special animation when shooting a projectile
firing = 0;

//Makes Mario do a special animation when flying with the raccoon / tanooki powerup
wiggle = 0;

//Sets direction of projectiles when doing a spin jump
dir = 1;

//Makes Mario able to jump in walls
walljump = 0;

//Carrot / Bee powerup flight variables
beefly = 0;
floatnow = 0;
isfloating = 0;

//Frog / Penguin powerup swimming variables
swimtype = 0;

//Squirrel powerup
squirrelpropel = 0;

//Prevents the player from moving if stunned
stuntime = 0;

//Prevents the player from moving if frozen
freezetime = 0;

//Makes the player shake when stunned
shake = 0;

//Mutes the 'Bump' sound when either the player is climbing or swimming with the frog or penguin powerups
noisy = 0;

//Player colour
isflashing = 0;

//How many consecutive stomps has Mario made
hitcombo = 0;

//If the player is warping from a pit.
pitwarp = false;

//Timers
_timer = 0;
event_user(9);

/*Create player markers
instance_create_layer(0, 0, "Main", obj_marker_head);
instance_create_layer(0, 0, "Main", obj_marker_feet);

//Create dash attack for the Football Mario powerup
if (instance_number(obj_dashkill) == 0)
	instance_create_layer(0, 0, "Main", obj_dashkill);
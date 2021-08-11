/// @description Collision with bumped blocks

if (other.vspeed < 0) 
&& (bbox_bottom < other.yprevious+5) {

	//Set the vertical speed
	yspeed = -2 + (swimming * 1);
	y--;
	
	//Reverse horizontal speed
	if ((xspeed > 0) && (x < other.x + sprite_get_width(sprite_index) / 2))
	|| ((xspeed < 0) && (x > other.x + sprite_get_width(sprite_index) / 2))
		xspeed = -xspeed;
}
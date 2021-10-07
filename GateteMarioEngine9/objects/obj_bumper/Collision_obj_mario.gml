/// @description Bounce against the bumper

//If the bumper is not bouncing
if (ready == 0) {
	
	//Play 'Bumper' sound
	audio_play_sound(snd_bumper, 0, false);
    
    //Set the horizontal speed
    other.xspeed = lengthdir_x(3, point_direction(x, y, other.x, other.y));
	
	//Bounce it
    ready = 1; 
    
    //Set the vertical speed
    if (other.y < y-12) {
    
        other.yspeed = -3.4675;
        if (input_check(input.action_0)) {
			
            other.jumping = 1;
			audio_stop_sound(snd_bumper);
			audio_play_sound(snd_bumper_high, 0, false);
		}
        else
            other.jumping = 2;
    }
    
    //Otherwise, bounce downwards
    else		
        other.yspeed = -other.yspeed;
}
/// @description Bounce against the bumper

//If the bumper is not bouncing
if (ready == 0) {
    
    //Play 'Trampoline' sound
    audio_play_sound(snd_trampoline, 0, false);
    
    //Bounce it
    ready = 1;    
    
    //Set the horizontal speed
    other.xspeed = lengthdir_x(3, point_direction(x, y, other.x, other.y));
    
    //Set the vertical speed
    if (other.y < y-12) {
    
        other.yspeed = -3.4675;
        if (input_check(input.action_0))
            other.jumping = 1;
        else
            other.jumping = 2;
    }
    
    //Otherwise, bounce downwards
    else
        other.yspeed = -other.yspeed;
}
/// @description Cycle between powerups

//Continue the cycle.
if (ready == 0) {

    //Repeat this process
    alarm[2] = 15;
    
    //Increment cycle
    numb++;
	
	//If the block is not outside the view
	if (!outside_view())
	&& (array_length(sprout) > 1)
		audio_play_sound(snd_move, 0, false);
}

//Reset sequence
if (numb == array_length(sprout)) 
    numb = 0;
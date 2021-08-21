/// @description Decrement the timer variable

//If there's time left
if (global.timer > 0) {

    //Decrement
    global.timer--;
    
    //Decrement again after a second
    alarm[2] = 40;
    
    //If there's 101 seconds left, play 'Hurry' sound
    if (global.timer == 101)
        alarm[3] = 40;
        
    //Otherwise, if there's 1 second left
    else if (global.timer == 1)
        alarm[4] = 41;
}
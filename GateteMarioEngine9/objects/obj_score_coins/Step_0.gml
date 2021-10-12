/// @description Effect logic

//If the effect is not ready
if (ready == false) {

    //If moving down
    if ((vspeed > 0) && (y > ystart-12)) {
    
        //Stop moving
        vspeed = 0;
        gravity = 0;
        
        //Snap in position
        y = ystart-12;
        
        //Destroy after a while
        ready = true
        alarm[1] = 48;
    }
}
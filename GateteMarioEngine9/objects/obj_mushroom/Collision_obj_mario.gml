/// @description Get 'Big' player status

//Play 'Powerup' sound.
audio_play_sound(snd_powerup, 0, false);

//Get 1000 points
with (instance_create_depth(x, y, -5, obj_score)) value = 1000;

//If Mario is small.
if (global.powerup == cs_small) {
    
    //Turn Mario into 'Super' Mario.
    global.powerup = cs_big;
        
    //Perform animation sequence
    with (instance_create_depth(0, 0, -5, obj_mario_transform))
        sequence = 0;
}
    
//Otherwise, get a reserve mushroom
else {
    
    //If NO item is in reserve.
    if (global.reserve = cs_small)
        global.reserve = cs_big;
}

//Destroy
instance_destroy();
/// @description Stop fading to black

//Set mode to fade from black
mode = 0;

/*If Mario Start! does not exist
if (!instance_exists(obj_mariostart)) {

    //Begin fading from black
    fade = 0;

    //Activate everything
    instance_activate_all();
}*/

//Delete the screenshot
if (sprite_exists(back))
    sprite_delete(back);
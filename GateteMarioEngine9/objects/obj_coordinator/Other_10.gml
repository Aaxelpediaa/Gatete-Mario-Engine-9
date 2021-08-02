/// @description Fade the screen to black

//If this event was called manually
if (mode == 0) {

    //Take a screenshot
    back = sprite_create_from_surface(application_surface, 0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0, 0, 0, 0);
    
    //Pixel size
    size = 64;

    //Deactivate everything except this
    instance_deactivate_all(1);    
}

//Start fading
fade = 0;

//To black
mode = 1;

//Make sure it stops when its done
alarm[3] = 30;
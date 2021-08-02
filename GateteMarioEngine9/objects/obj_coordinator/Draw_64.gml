/// @description Deals with the application surface, window size, and fading.

//Disable alpha blending
gpu_set_blendenable(false);

//If the screen is fading
if (fade < 1) 
&& (size > 0.75) 
&& (pixelate <= 0) {
    
    shader_set(shd_pixel);
    shader_set_uniform_f(pixel, global.gw, global.gh, size, size);
}

//Draw a rectangle
draw_rectangle_colour(0, 0, global.gw*size, global.gh*size, c_black, c_black, c_black, c_black, 0);

//Draw the application surface
draw_surface_stretched(application_surface, 0, 0, global.gw*size, global.gh*size);

//Reset shader
shader_reset();

//Enable alpha blending
gpu_set_blendenable(true);

//Fades the screen to and from black
if (fade < 1) {

    //Increment fading
    fade += 1/30;

    //Fade from black
    if (mode = 0) {
    
        draw_set_alpha(1-fade);
        size -= 0.75;
    }

    //Fade to black
    else {
    
        draw_set_alpha(fade);
        size += 0.75;
    }
    
	//Draw the rectangle
	draw_rectangle_colour(0, 0, 5000, 5000, c_black, c_black, c_black, c_black, 0);
	
	//Set alpha
	draw_set_alpha(1);
}
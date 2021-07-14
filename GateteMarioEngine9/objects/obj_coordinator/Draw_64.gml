/// @description Deals with the application surface, window size, and fading.

//Disable alpha blending
gpu_set_blendenable(false);

//Draw a rectangle
draw_rectangle_colour(0, 0, global.gw*(size), global.gh*(font_texture_page_size), c_black, c_black, c_black, c_black, 0);

//Draw the application surface
draw_surface_stretched(application_surface, 0, 0, global.gw*(size), global.gh*(size));

//Enable alpha blending
gpu_set_blendenable(true);
/// @description Draw score

//Align text
draw_set_halign(fa_center);

//Set up font
draw_set_font(font);

//If this object is giving extra lives, draw sprite
if (value < 0)
&& (sprite_index > -1) {
	
	//Stay in-view
	if (y < camera_get_view_y(view_camera[0]) + 32)
		draw_sprite(sprite_index, -1, x, camera_get_view_y(view_camera[0]) + 32);
	else
		draw_sprite(sprite_index, -1, x, y);
}
else {

	//Stay in view
	if (y < camera_get_view_y(view_camera[0]) + 32)
		draw_text(x-1, camera_get_view_y(view_camera[0]) + 32, string(value));
	else
		draw_text(x-1, y, string(value)); 
}

//Reset alignment
draw_set_halign(fa_left);
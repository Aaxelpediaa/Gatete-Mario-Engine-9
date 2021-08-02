/// @description Placeholder title screen

draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_text_colour(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, "Press Start to beginulate!", c_black, c_black, c_black, c_black, 1);

draw_set_valign(fa_top);
draw_set_halign(fa_left);
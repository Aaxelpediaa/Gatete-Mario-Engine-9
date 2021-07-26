/// @description Draw the HUD

//Set default font and colour
draw_set_font(global.gui_font_numbers);
draw_set_colour(c_white);

//Lives
draw_sprite_ext(spr_gui_mario, 0, camera_get_view_x(view_camera[0]) + 8, camera_get_view_y(view_camera[0]) + 8, 1, 1, 0, c_white, 1);
draw_text(camera_get_view_x(view_camera[0]) + 40, camera_get_view_y(view_camera[0]) + 8, string_format(lives, 2, 0));

//Coins
draw_sprite_ext(spr_gui_coins, 0, camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 19, 1, 1, 0, c_white, 1);
draw_text(camera_get_view_x(view_camera[0]) + 40, camera_get_view_y(view_camera[0]) + 19, string_add_zeroes(global.coins, 2));

//Star Coins
#region STAR COINS

#endregion

//Reserve Box
draw_sprite_ext(spr_gui_global_reserve, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + 8, 1, 1, 0, c_white, 1);

//Set black font
draw_set_font(global.gui_font_numbers_black);

//Score
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 144, camera_get_view_y(view_camera[0]) + 8, string_add_zeroes(score, 8));

//Set gold font
draw_set_font(global.gui_font_numbers_gold);

//Time
draw_sprite_ext(spr_gui_time, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 48, camera_get_view_y(view_camera[0]) + 8, 1, 1, 0, c_white, 1);
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 32, camera_get_view_y(view_camera[0]) + 8, string_add_zeroes(global.timer, 3));

//Set large font
draw_set_font(global.gui_font_numbers_large)

//Coin Collect-a-thon
if (collect_mode > -1) {
	
	draw_sprite_ext(spr_gui_bonus, 0, camera_get_view_x(view_camera[0]) + 8, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 24, 1, 1, 0, c_white, 1);
	if (collect_mode > 0)
		draw_text(camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 24, string_add_zeroes(collect_mode, 3));
}

//P-Meter
#region P-METER
	
	//If the player does exist
	if (instance_exists(obj_mario)) {
	
		//If the P-Wing is active or the P-Meter is above 111
		if (global.pwing == 1)
		|| (obj_mario.pmeter > 143)
			draw_sprite_ext(spr_gui_pmeter, 6+flash, camera_get_view_x(view_camera[0]) + 56, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16, 1, 1, 0, c_white, 1);
		else
			draw_sprite_ext(spr_gui_pmeter, 0+(obj_mario.pmeter/24), camera_get_view_x(view_camera[0]) + 56, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16, 1, 1, 0, c_white, 1);
	}
	else {
	
		draw_sprite_ext(spr_gui_pmeter, 0+(fake_pm/24), camera_get_view_x(view_camera[0]) + 56, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16, 1, 1, 0, c_white, 1);
	}
#endregion

//SMB3 Card System
#region SMB3 CARDS

	if (show_cards > 0) {
	
		draw_sprite_ext(spr_gui_cardbox, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 53, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 21, 1, 1, 0, c_white, 1);
	}
#endregion
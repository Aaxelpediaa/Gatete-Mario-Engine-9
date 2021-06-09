/// @function index_powerups();
function index_powerups() {

	var powerup_count = 23;

	for (var i = 0; i < powerup_count; i ++) {
		
		show_debug_message(i);
		
		global.carry_sprite[i] =		asset_get_index("spr_mario_"+powerup_get_name(i)+"_carry");
		global.carry_jump_sprite[i] =	asset_get_index("spr_mario_"+powerup_get_name(i)+"_carry_jump");
		global.clear_sprite[i] =		asset_get_index("spr_mario_"+powerup_get_name(i)+"_clear");
		global.climb_sprite[i] =		asset_get_index("spr_mario_"+powerup_get_name(i)+"_climb");
		global.duck_sprite[i] =			asset_get_index("spr_mario_"+powerup_get_name(i)+"_duck");
		global.goal_sprite[i] =			asset_get_index("spr_mario_"+powerup_get_name(i)+"_goal");
		global.hold_sprite[i] =			asset_get_index("spr_mario_"+powerup_get_name(i)+"_hold");
		global.hold_jump_sprite[i] =	asset_get_index("spr_mario_"+powerup_get_name(i)+"_jump");
		global.hold2_sprite[i] =		asset_get_index("spr_mario_"+powerup_get_name(i)+"_hold2");
		global.hold2_jump_sprite[i] =	asset_get_index("spr_mario_"+powerup_get_name(i)+"_hold2_jump");
		global.jump_sprite[i] =			asset_get_index("spr_mario_"+powerup_get_name(i)+"_jump");
		global.kick_sprite[i] =			asset_get_index("spr_mario_"+powerup_get_name(i)+"_kick");
		global.ride_sprite[i] =			asset_get_index("spr_mario_"+powerup_get_name(i)+"_ride");
		global.run_sprite[i] =			asset_get_index("spr_mario_"+powerup_get_name(i)+"_run");
		global.runjump_sprite[i] =		asset_get_index("spr_mario_"+powerup_get_name(i)+"_runjump");
		global.skid_sprite[i] =			asset_get_index("spr_mario_"+powerup_get_name(i)+"_skid");
		global.slide_sprite[i] =		asset_get_index("spr_mario_"+powerup_get_name(i)+"_slide");
		global.somersault_sprite[i] =	asset_get_index("spr_mario_"+powerup_get_name(i)+"_somersault");
		global.spin_sprite[i] =			asset_get_index("spr_mario_"+powerup_get_name(i)+"_spin");
		global.swim_sprite[i] =			asset_get_index("spr_mario_"+powerup_get_name(i)+"_swim");
		global.walk_sprite[i] =			asset_get_index("spr_mario_"+powerup_get_name(i)+"_walk");
		global.walljump_sprite[i] =		asset_get_index("spr_mario_"+powerup_get_name(i)+"_walljump");
		global.float_sprite[i] =		asset_get_index("spr_mario_"+powerup_get_name(i)+"_float");
		
	}

}
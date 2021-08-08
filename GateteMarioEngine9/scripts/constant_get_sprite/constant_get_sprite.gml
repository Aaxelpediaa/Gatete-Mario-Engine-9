// @function constant_get_sprite
// @param constant

function constant_get_sprite() {

	switch (argument[0]) {
	
	    case (cs_big): return spr_mushroom;
	    case (cs_fire): return spr_fireflower;
	    case (cs_ice): return spr_iceflower;
	    case (cs_carrot): return spr_carrot;
	    case (cs_raccoon): return spr_leaf;
	    case (cs_frog): return spr_frogsuit;
	    case (cs_tanooki): return spr_tanookisuit;
	    case (cs_hammer): return spr_hammerflower;
	    case (cs_boomerang): return spr_boomerangflower;
	    case (cs_superball): return spr_superflower;
	    case (cs_bomb): return spr_bombshroom;
	    case (cs_shell): return spr_blueshell;
	    case (cs_bee): return spr_beeshroom;
	    case (cs_volt): return spr_voltshroom;
	    case (cs_penguin): return spr_penguinsuit;
	    case (cs_propeller): return spr_propellershroom;
	    case (cs_bell): return spr_superbell;
	    case (cs_football): return spr_helmet;
		case (cs_ranger): return spr_rangersuit;
		case (cs_squirrel): return spr_superacorn;
		case (cs_mega): return spr_megashroom;
	    case (cs_yoshi_g): return spr_egg;
	    case (cs_yoshi_r): return spr_egg_r;
	    case (cs_yoshi_y): return spr_egg_y;
	    case (cs_yoshi_b): return spr_egg_b;
	    case (cs_yoshi_t): return spr_egg_t;
	    case (cs_yoshi_p): return spr_egg_p;
	    case (cs_shoe_kuribo): return spr_kuriboshoe;
	    case (cs_shoe_baburu): return spr_baburushoe;
	    case (cs_shoe_dossun): return spr_dossunshoe;
	    case (cs_shoe_jugemu): return spr_jugemushoe;
	    case (cs_shoe_pentaro): return spr_pentaroshoe;
		case (cs_lifeshroom): return spr_lifeshroom;
		case (cs_pballoon): return spr_pballoon;
		case (cs_pwing): return spr_pwing;
	    case (cs_1up): return spr_1up;
	    case (cs_3up): return spr_3upmoon;
		case (cs_poison): return spr_poison;
		case (cs_starman): return spr_starman;
		case (cs_pswitch): return spr_pswitch;
		case (cs_sswitch): return spr_sswitch;
		case (cs_key): return spr_key;
		case (cs_trampoline): return spr_trampoline;
		case (cs_propellerblock): return spr_propellerblock;
		case (cs_billy): return spr_billygun;
		case (cs_beanstalk): return spr_beanstalk;
		default: return -1;
	}
}
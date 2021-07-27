/// @description Draw cape

/*

//If the player does exist
if (instance_exists(obj_playerparent)) {

    //Set up the palette
    player_set_palette(obj_playerparent);
    
    //Only draw if the player has a cape
    if (global.powerup == cs_pow_cape)
    && (instance_number(obj_spinner) == 0)
    && (instance_number(obj_cape_fly) == 0) 
    && (instance_number(obj_player_wallrunning) == 0) {
    
        //If the player is not riding a yoshi
        if (global.mount == 0)
            draw_sprite_ext(sprite_index, image_index, round(x), round(y)+1+yy, image_xscale, 1, 0, c_white, image_alpha);
            
        //Otherwise, if the player is riding a yoshi
        else {
        
            if (instance_exists(obj_yoshi)) {
                
                if (obj_yoshi.f == 1)
                    draw_sprite_ext(sprite_index, image_index, round(x-3*sign(obj_playerparent.xscale)), round(y)-5+yy, image_xscale, 1, 0, c_white, image_alpha);
                else
                    draw_sprite_ext(sprite_index, image_index, round(x-3*sign(obj_playerparent.xscale)), round(y)-7+yy, image_xscale, 1, 0, c_white, image_alpha);
            }
            else if instance_exists(obj_player_transform) {
            
                if (obj_player_transform.riderframe == 1)
                    draw_sprite_ext(sprite_index, image_index, round(x-3*sign(obj_playerparent.xscale)), round(y)-5+yy, image_xscale, 1, 0, c_white, image_alpha);
                else
                    draw_sprite_ext(sprite_index, image_index, round(x-3*sign(obj_playerparent.xscale)), round(y)-7+yy, image_xscale, 1, 0, c_white, image_alpha);            
            }
        }
    }
    
    //Reset palette
    pal_swap_reset();
}

*/
/// @description Handle tile movement

//Check tiles in layer
var lay_id = layer_get_id(target_layer);
var map_id = layer_tilemap_get_id(lay_id);

//Get position
var _xx = tilemap_get_x(map_id);
var _yy = tilemap_get_y(map_id);

//Set position
tilemap_x(map_id, _xx + hspeed);
tilemap_y(map_id, _yy + vspeed);

//Manage collision position
#region MOVE COLLISIONS

	with (obj_solid_moving) {
	
		hspeed = other.hspeed;
		vspeed = other.vspeed;
	}
	with (obj_semisolid_moving) {
	
		hspeed = other.hspeed;
		vspeed = other.vspeed;
	}

#endregion

//Movement
if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_up, 0, 0))
    vspeed -= target_speed;
else if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_down, 0, 0))
    vspeed += target_speed;
else if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_left, 0, 0))
    hspeed -= target_speed;
else if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_right, 0, 0))
    hspeed += target_speed;
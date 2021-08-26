//Every object that will stay persistent during the freeze needs to be placed in this array
global.keep_activated = [
	
	obj_water_front,
	obj_effectsparent	
]

/// @function									freeze_create(surface[OPTIONAL]);
/// @param {bool} freeze_persistent[OPTIONAL]	If the objects from the keep_activated array should freeze anyway
/// @param {surface} surface[OPTIONAL]			The surface to create the pre-freeze from
function freeze_create() {
	
	//The snapshot itself
	snapshot = -1;
	
	//Surface
	_indexedSurfaceVariable = (argument_count > 1) ? argument[1] : application_surface;
	_indexedFreezePersistentVariable = (argument_count > 0) ? argument[0] : false;

	//Create pre-freeze
	if (global.prefreeze == noone) {
		
		global.prefreeze = surface_create(surface_get_width(_indexedSurfaceVariable), surface_get_height(_indexedSurfaceVariable));
		surface_copy(global.prefreeze, 0, 0, _indexedSurfaceVariable);
	}

	//Make objects invisible
	if (!_indexedFreezePersistentVariable) {
		
		for (var i = 0; i < array_length(global.keep_activated); i ++) {
			
			with (global.keep_activated[i])
				visible = false;			
		}
	}
	
	//Set up actual final surface
	var _temp = function() {
	
		//Destroy pre-freeze
		surface_free(global.prefreeze);
		global.prefreeze = noone;

		//Deactivate all instances
		instance_deactivate_all(true);
		
		//Activate HUD
		instance_activate_object(obj_hud);

		//Activate coordinator object
		instance_activate_object(obj_coordinator);
		
		//Create the snapshot
		snapshot = surface_create(room_width, room_height);
		
		//Set the target surface
		surface_set_target(snapshot);
		
		//Draw surface
		draw_surface(application_surface, 0, 0);
		
		//Make objects visible
		if (!_indexedFreezePersistentVariable) {
			
			for (var i = 0; i < array_length(global.keep_activated); i ++) {
			
				instance_activate_object(global.keep_activated[i]);
				with (global.keep_activated[i])
					visible = true;			
			}
		}
		
		//Reset surface
		surface_reset_target();
	}
	
	//Run _temp function
	timer(_temp, 1, false);
}
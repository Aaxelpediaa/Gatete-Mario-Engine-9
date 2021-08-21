//Every object that will stay persistent during the freeze needs to be placed in this array
global.keep_activated = [
	
	obj_water_front,
	obj_effectsparent,	
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
	global.prefreeze = surface_create(surface_get_width(_indexedSurfaceVariable), surface_get_height(_indexedSurfaceVariable));
    
	//Copy the contents over from the given surface.
	surface_copy(global.prefreeze, 0, 0, _indexedSurfaceVariable);

	//Make objects invisible
	if (!_indexedFreezePersistentVariable) {
		
		for (var i = 0; i < array_length(global.keep_activated); i ++) {
			
			with (global.keep_activated[i])
				visible = false;			
		}
	}

	//Freeze all NPCs
	with (obj_physicsparent) event_user(14);
	
	//Set up actual final surface
	timer(function() {
	
		//Destroy pre-freeze
		surface_free(global.prefreeze);
		global.prefreeze = noone;

		//Create a snapshot
		snapshot = sprite_create_from_surface(_indexedSurfaceVariable, 0, 0, surface_get_width(_indexedSurfaceVariable), surface_get_height(_indexedSurfaceVariable), 0, 1, 0, 0);

		//Deactivate all instances
		instance_deactivate_all(true);

		//Activate coordinator object
		instance_activate_object(obj_coordinator);
		
		// Make objects visible
		if (!_indexedFreezePersistentVariable) {
			
			for (var i = 0; i < array_length(global.keep_activated); i ++) {
			
				instance_activate_object(global.keep_activated[i]);
				with (global.keep_activated[i])
					visible = true;			
			}
		}
	}, 1);
}
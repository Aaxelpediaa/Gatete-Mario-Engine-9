/// @function					prefreeze_create(surface);
/// @param {surface} surface	The surface to create the pre-freeze from
function prefreeze_create(surface) {

	//Creating the prefreeze surface.
	global.prefreeze = surface_create(surface_get_width(surface), surface_get_height(surface));
    
	//Copy the contents over from the given surface.
	surface_copy(global.prefreeze, 0, 0, surface);
	
}
/// @description Fade the screen in

//Default variables
target = noone;

//Take a screenshot
back = sprite_create_from_surface(application_surface, 0, 0, room_width, room_height, 0, 0, 0, 0);

//Deactivate all instances
instance_deactivate_all(1);

//Activate persistent object
instance_activate_object(obj_coordinator);

//Set the alpha
alpha = 0;
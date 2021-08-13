/// @description Displays a message

//Default variables
varmsg = "No message set.";
mute_sound = false;

//Is the message showing
showing = 0;

//Scale
scale = 0;

//Create a snapshot
snapshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 1, 0, 0);

//Deactivate all instances
instance_deactivate_all(1);

//Activate coordinator object
instance_activate_object(obj_coordinator);
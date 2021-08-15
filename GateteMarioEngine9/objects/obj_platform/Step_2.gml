/// @description Mario's logic (While on platform)

//If this platform is not moving, exit this event.
if (speed == 0)
exit;

//Check for the player
var player = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

//If the player exists
if (player)
&& (player.state != playerstate.jump)
&& (player.bbox_bottom < yprevious+5) {
    
    //Snap the player vertically
    player.y = ceil(bbox_top-16);

    //Snap the player horizontally
    player.x += x-xprevious;
    if (collision_rectangle(player.bbox_right, player.bbox_top+4, player.bbox_right+1, player.bbox_bottom-1, obj_solid, 1, 1))
        player.x--;
    else if (collision_rectangle(player.bbox_left-1, player.bbox_top+4, player.bbox_left, player.bbox_bottom-1, obj_solid, 1, 1))
        player.x++;  
}
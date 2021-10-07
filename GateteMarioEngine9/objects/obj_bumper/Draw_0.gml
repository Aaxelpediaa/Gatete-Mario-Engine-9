/// @description Render me

//If bouncing...
if (ready == 1) {

    scale += 0.05;
    if (scale > 1.2)
        ready = 2;
}

//If returning to normal
else if (ready == 2) {

    scale -= 0.05;
    if (scale < 1) {
    
        scale = 1;
        ready = 0;
    }
}

//Render me
if (ready > 0)
    draw_sprite_ext(sprite_index, 2, round(x), round(y), scale, scale, 0, c_white, 1);
else
    draw_sprite_ext(sprite_index, -1, round(x), round(y), 1, 1, 0, c_white, 1);
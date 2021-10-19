/// @description Pendulum Platform (Platform) logic

//Time it
mytimer += 0.45;
angle = cos(mytimer * 0.045) * (pi/2);

//Set the position of the block
x = xx - sin(angle) * parent.distance;
y = yy + cos(angle) * parent.distance;
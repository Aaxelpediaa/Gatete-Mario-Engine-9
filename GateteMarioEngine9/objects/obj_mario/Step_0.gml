/// @description Mario's logic!

//Inherit event from parent
event_inherited();

//Update position based on xspeed and yspeed values
x += xspeed;
y += yspeed;
xspeed += xadd;
yspeed += yadd;

//Manage timer actions
#region TIMERS

	//TIMER 1: INVINCIBILITY
	invincibility = function() {
	
		
	}
	
#endregion
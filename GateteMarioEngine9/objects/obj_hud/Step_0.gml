/// @description Display cards and fake up P-Meter depletion

show_cards--;
if (fake_pm == 0) {
	
	if (instance_exists(obj_mario))
	&& (obj_mario.pmeter > 0)
		fake_pm = obj_mario.pmeter;
}
else
	fake_pm--;
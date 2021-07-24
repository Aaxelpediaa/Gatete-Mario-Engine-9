/// @description Fake up P-Meter depletion

if (fake_pm == 0) {
	
	if (instance_exists(obj_mario))
	&& (obj_mario.pmeter > 0)
		fake_pm = obj_mario.pmeter;
}
else
	fake_pm--;
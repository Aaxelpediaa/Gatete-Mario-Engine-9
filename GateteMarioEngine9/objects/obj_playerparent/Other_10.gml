/// @description Default hurt script

//Become invulnerable
invulnerable = true;

//Run a repeating timer and save it to a temporary variable
var _timer = timer(change_alpha, 1, true);

//Destroy the timer and make the player vulnerable in 2 seconds
timer(become_vulnerable, 120, false, _timer);
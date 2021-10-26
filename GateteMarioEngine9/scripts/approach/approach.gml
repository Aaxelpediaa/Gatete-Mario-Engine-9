/// @description	approach(start, end, shift);
/// @param start	start value, real
/// @param end		end value, real
/// @param shift	shift value, real

function approach() {

	if (argument[0] < argument[1])
	    return min(argument[0] + argument[2], argument[1]); 
	else
	    return max(argument[0] - argument[2], argument[1]);
}
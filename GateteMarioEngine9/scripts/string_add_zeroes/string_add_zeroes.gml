/// @function string_add_zeroes(number,digits);
/// @param number
/// @param digits

function string_add_zeroes(number,digits) {

	return string_replace_all(string_format(argument[0], argument[1], 0), " ", "0");
}
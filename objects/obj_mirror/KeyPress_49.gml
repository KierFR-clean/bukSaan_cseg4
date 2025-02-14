if is_nearToObjMirror 
{
	global.dialogue = "Hmm... there's an inscription along the frame,\n \""
	+ atbash_cipher + "\".  Could this be a clue to a \n hidden secret nearby?";
	global.a_cipher = atbash_cipher;
	alarm[0] = 6 * room_speed;
}
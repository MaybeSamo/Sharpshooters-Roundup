var key_left   = keyboard_check_pressed(vk_left);
var key_right  = keyboard_check_pressed(vk_right);
var key_accept = keyboard_check_pressed(ord("Z"));
var key_return = keyboard_check_pressed(ord("X"));


if  (key_accept) or (key_left) {
	playanim("banjo_hit1")
	hittimer = 0
}

if  (key_return) or (key_right) {
	playanim("banjo_hit2")
	hittimer = 0
}

if not (key_accept) and not (key_left) and not (key_return) and not (key_right) {
	hittimer += 0.1
	if hittimer > 0.3 {
		var actor = global.party_battle_actors[party_member_selected];
		actor.image_index = 1;
	}
}
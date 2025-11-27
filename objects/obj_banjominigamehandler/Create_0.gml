
party_member_selected = 0
hittimer = 0

var cam = view_camera[0]
var actor = global.party_battle_actors[party_member_selected]

olddepth = actor.depth
oldx = actor.x
oldy = actor.y

global.party_battle_actors[party_member_selected].depth = -999999999
global.party_battle_actors[party_member_selected].x = camera_get_view_x(cam) + camera_get_view_width(cam) / 2
global.party_battle_actors[party_member_selected].y = camera_get_view_y(cam) + camera_get_view_height(cam) / 4

/// @param name animation name
/// @param loop bool (or false)
/// @param partyid int (or 0)
function playanim(name, loop, partyid) {
	
	// default values
    loop = loop ?? false
    partyid = partyid ?? 0
	
	party_member_selected = partyid;
	var actor = global.party_battle_actors[party_member_selected]

    actor.image_index = 0
    actor.sprite_index = variable_struct_get(actor.sprites,name)
    actor.loop_animation = loop
}

playanim("banjo_idle")
writer = instance_create_depth(camerax() + 20, cameray() + 196, -99999, obj_writer);
writer.text = ["* The Sharp Shooter breaks through!"];
writer.snd = snd_nosound;
writer.can_accept = false;
soul = instance_create_depth(camerax() + 0, cameray() + 0, -99999, obj_dtr_battle_soul);

global.battle_state = BattleState.SelectAction;
global.party_member_actions = [];
global.battle_con = 0;
global.attack_timer = 0;

fade_alpha = 0;
fadecon = 0;
current_action = 0;

party_member_selected = 0;

enum BattleState {
    SelectAction = 0,
    SelectEnemy = 1,
    SelectItem = 2,
    Attack = 3,
    DoActions = 4
}

enum BattleAction {
    Fight = 0,
    Act = 1,
    Item = 2,
    Spare = 3,
    Defend = 4,
    Magic = 5,
}
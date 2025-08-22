/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 5AAFF34F
/// @DnDArgument : "var" "global.attack_timer"
/// @DnDArgument : "value" "200"
if(global.attack_timer == 200){	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 58C02A0A
	/// @DnDParent : 5AAFF34F
	instance_destroy();

	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 4BCEF425
	/// @DnDParent : 5AAFF34F
	/// @DnDArgument : "value" "BattleState.SelectAction"
	/// @DnDArgument : "var" "global.battle_state"
	global.battle_state = BattleState.SelectAction;

	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 790EF772
	/// @DnDParent : 5AAFF34F
	/// @DnDArgument : "var" "global.attack_timer"
	global.attack_timer = 0;

	/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
	/// @DnDVersion : 1.1
	/// @DnDHash : 5025AE09
	/// @DnDParent : 5AAFF34F
	/// @DnDArgument : "sound" "mus_minigame_banjo_banjo"
	/// @DnDArgument : "volume" "0"
	/// @DnDSaveInfo : "sound" "mus_minigame_banjo_banjo"
	audio_sound_gain(mus_minigame_banjo_banjo, 0, 0);

	/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
	/// @DnDVersion : 1.1
	/// @DnDHash : 274A3974
	/// @DnDParent : 5AAFF34F
	/// @DnDArgument : "sound" "mus_minigame_banjo_inst"
	/// @DnDArgument : "volume" "0"
	/// @DnDSaveInfo : "sound" "mus_minigame_banjo_inst"
	audio_sound_gain(mus_minigame_banjo_inst, 0, 0);}
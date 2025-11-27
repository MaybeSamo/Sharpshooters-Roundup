/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 09B2943D
/// @DnDArgument : "var" "global.attack_timer"
/// @DnDArgument : "op" "1"
/// @DnDArgument : "value" "5"
if(global.attack_timer < 5){	/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
	/// @DnDVersion : 1.1
	/// @DnDHash : 5A369BD8
	/// @DnDParent : 09B2943D
	/// @DnDArgument : "sound" "mus_minigame_banjo_banjo"
	/// @DnDSaveInfo : "sound" "mus_minigame_banjo_banjo"
	audio_sound_gain(mus_minigame_banjo_banjo, 1, 0);

	/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
	/// @DnDVersion : 1.1
	/// @DnDHash : 5DD79BA8
	/// @DnDParent : 09B2943D
	/// @DnDArgument : "sound" "mus_minigame_banjo_inst"
	/// @DnDSaveInfo : "sound" "mus_minigame_banjo_inst"
	audio_sound_gain(mus_minigame_banjo_inst, 1, 0);

	/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
	/// @DnDVersion : 1.1
	/// @DnDHash : 5F8F038E
	/// @DnDParent : 09B2943D
	/// @DnDArgument : "sound" "mus_sharpshooter"
	/// @DnDArgument : "volume" "0.7"
	/// @DnDSaveInfo : "sound" "mus_sharpshooter"
	audio_sound_gain(mus_sharpshooter, 0.7, 0);}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 5AAFF34F
/// @DnDArgument : "var" "global.attack_timer"
/// @DnDArgument : "value" "200"
if(global.attack_timer == 200){	/// @DnDAction : YoYo Games.Common.Set_Global
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
	audio_sound_gain(mus_minigame_banjo_inst, 0, 0);

	/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
	/// @DnDVersion : 1.1
	/// @DnDHash : 6DEE0C5A
	/// @DnDParent : 5AAFF34F
	/// @DnDArgument : "sound" "mus_sharpshooter"
	/// @DnDSaveInfo : "sound" "mus_sharpshooter"
	audio_sound_gain(mus_sharpshooter, 1, 0);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 3BDB858D
	/// @DnDParent : 5AAFF34F
	/// @DnDArgument : "function" "scr_handle_end_attack"
	scr_handle_end_attack();

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 4F4CBA9E
	/// @DnDParent : 5AAFF34F
	instance_destroy();}
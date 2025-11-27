/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 0C71BC7B
/// @DnDArgument : "objectid" "obj_banjominigamehandler"
/// @DnDSaveInfo : "objectid" "obj_banjominigamehandler"
instance_create_layer(0, 0, "Instances", obj_banjominigamehandler);

/// @DnDAction : YoYo Games.Audio.If_Audio_Playing
/// @DnDVersion : 1
/// @DnDHash : 44602820
/// @DnDArgument : "soundid" "mus_minigame_banjo_banjo"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "soundid" "mus_minigame_banjo_banjo"
var l44602820_0 = mus_minigame_banjo_banjo;if (!audio_is_playing(l44602820_0)){	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 303B55EB
	/// @DnDParent : 44602820
	/// @DnDArgument : "soundid" "mus_minigame_banjo_banjo"
	/// @DnDArgument : "loop" "1"
	/// @DnDSaveInfo : "soundid" "mus_minigame_banjo_banjo"
	audio_play_sound(mus_minigame_banjo_banjo, 0, 1, 1.0, undefined, 1.0);}

/// @DnDAction : YoYo Games.Audio.If_Audio_Playing
/// @DnDVersion : 1
/// @DnDHash : 4CADAB23
/// @DnDArgument : "soundid" "mus_minigame_banjo_inst"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "soundid" "mus_minigame_banjo_inst"
var l4CADAB23_0 = mus_minigame_banjo_inst;if (!audio_is_playing(l4CADAB23_0)){	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 182BA5ED
	/// @DnDParent : 4CADAB23
	/// @DnDArgument : "soundid" "mus_minigame_banjo_inst"
	/// @DnDArgument : "loop" "1"
	/// @DnDSaveInfo : "soundid" "mus_minigame_banjo_inst"
	audio_play_sound(mus_minigame_banjo_inst, 0, 1, 1.0, undefined, 1.0);}

/// @DnDAction : YoYo Games.Audio.If_Audio_Playing
/// @DnDVersion : 1
/// @DnDHash : 42FB0552
/// @DnDArgument : "soundid" "mus_sharpshooter"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "soundid" "mus_sharpshooter"
var l42FB0552_0 = mus_sharpshooter;if (!audio_is_playing(l42FB0552_0)){	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 2C2255F1
	/// @DnDParent : 42FB0552
	/// @DnDArgument : "soundid" "mus_sharpshooter"
	/// @DnDArgument : "loop" "1"
	/// @DnDSaveInfo : "soundid" "mus_sharpshooter"
	audio_play_sound(mus_sharpshooter, 0, 1, 1.0, undefined, 1.0);}
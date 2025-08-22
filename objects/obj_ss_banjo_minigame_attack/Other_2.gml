/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 792D3399
/// @DnDArgument : "soundid" "mus_minigame_banjo_banjo"
/// @DnDArgument : "loop" "1"
/// @DnDSaveInfo : "soundid" "mus_minigame_banjo_banjo"
audio_play_sound(mus_minigame_banjo_banjo, 0, 1, 1.0, undefined, 1.0);

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 187DB2B0
/// @DnDArgument : "soundid" "mus_minigame_banjo_inst"
/// @DnDArgument : "loop" "1"
/// @DnDSaveInfo : "soundid" "mus_minigame_banjo_inst"
audio_play_sound(mus_minigame_banjo_inst, 0, 1, 1.0, undefined, 1.0);

/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
/// @DnDVersion : 1.1
/// @DnDHash : 6D01FB7F
/// @DnDArgument : "sound" "mus_minigame_banjo_banjo"
/// @DnDArgument : "volume" "0"
/// @DnDSaveInfo : "sound" "mus_minigame_banjo_banjo"
audio_sound_gain(mus_minigame_banjo_banjo, 0, 0);

/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
/// @DnDVersion : 1.1
/// @DnDHash : 05AC2B06
/// @DnDArgument : "sound" "mus_minigame_banjo_inst"
/// @DnDArgument : "volume" "0"
/// @DnDSaveInfo : "sound" "mus_minigame_banjo_inst"
audio_sound_gain(mus_minigame_banjo_inst, 0, 0);
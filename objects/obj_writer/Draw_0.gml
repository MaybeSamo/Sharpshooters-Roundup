var accept_key = keyboard_check_pressed(ord("Z"));
var skip_key = keyboard_check_pressed(ord("X"));

var _text = text[page];
var _pages = array_length(text);

var _draw_x = x;
var _draw_y = y;

draw_set_font(fnt);
draw_set_alpha(1);
draw_set_color(c_white);

var shaking = false;
var wave = false;
var sound_char_played = true;

siner += 1;

if (!typing) {
    draw_char = 9999;
}

if (!use_box) {
    _draw_x = x;
    _draw_y = y;
} else if (use_box) {
    if (global.box_pos == "bottom") {
        if (current_expression == "") {
            _draw_x = global.camerax + 30;
        } else {
            _draw_x = global.camerax + 80;
        }
        _draw_y = global.cameray + 165;
    } else if (global.box_pos == "top") {
        if (current_expression == "") {
            _draw_x = global.camerax + 30;
        } else {
            _draw_x = global.camerax + 80;
        }
        _draw_y = global.cameray + 20; // adjusted for top position
    }
}

if (use_box) {
    var expr_data = scr_get_expression(current_expression);
    var face_sprite = expr_data.sprite;

    if (expr_data.sound != undefined) {
        snd = expr_data.sound;
    } else {
        snd = snd_generic_text;
    }

    // Draw face sprite
    if (global.box_pos == "bottom") {
        draw_sprite(spr_textbox, 0, global.camerax + 160, global.cameray + 192); 
        if (face_sprite != -1) {
            draw_sprite(face_sprite, 0, global.camerax + 50, global.cameray + 192);
        }
    } else if (global.box_pos == "top") {
        draw_sprite(spr_textbox, 0, global.camerax + 160, global.cameray + 47);
        if (face_sprite != -1) {
            draw_sprite(face_sprite, 0, global.camerax + 50, global.cameray + 47);
        }
    }
}

var _i = 1;
var _char_count = 0;

while (_i <= string_length(_text) && _char_count < draw_char) {
    var _char = string_char_at(_text, _i);
    
    if (_char == "^") {
        var _next_char = string_char_at(_text, _i + 1);
        if (is_real(real(_next_char))) {
            if (_char_count == draw_char - 1 && !delayed && !skip_key) {
                delayed = true;
                delay_timer = 0;
            }
            _i += 2;
            continue;
        }
    }
    
    if (_char == "/") {
        var _next_char = string_char_at(_text, _i + 1);
        switch (_next_char) {
            case "R":
                draw_set_color(c_red);
                _i += 2;
                continue;
            case "W":
                draw_set_color(c_white);
                _i += 2;
                continue;
            case "Y":
                draw_set_color(c_yellow);
                _i += 2;
                continue;
        }
    }
    
    if (_char == "@") {
        var _next_char = string_char_at(_text, _i + 1);
        switch (_next_char) {
            case "S":
                shaking = true;
                _i += 2;
                continue;
            case "N":
                shaking = false;
                wave = false;
                _i += 2;
                continue;
            case "W":
                wave = true;
                shaking = false;
                _i += 2;
                continue;
        }
    }
    
    if (_char == "#") {
        var _next_char = string_char_at(_text, _i + 1);
        
        if (_next_char == "E") {
            var _exp_name = "";
            var _j = _i + 2; // Start after "#E"
        
            while (_j <= string_length(_text)) {
                var ch = string_char_at(_text, _j);
                if (!((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9") || ch == "_")) {
                    break;
                }
                _exp_name += ch;
                _j++;
            }
        
            // 🔧 Normalize the expression name
            _exp_name = string_upper(string_trim(_exp_name));
        
            current_expression = _exp_name;
            _i = _j;
            continue;
        }
    }

    if (_char == "\n") {
        if (use_box) {
            if (global.box_pos == "top") {
                if (current_expression == "") {
                    _draw_x = global.camerax + 30;
                } else {
                    _draw_x = global.camerax + 80;
                }
            } else {
                if (current_expression == "") {
                    _draw_x = global.camerax + 30;
                } else {
                    _draw_x = global.camerax + 80;
                }
            }
        }

        if (!use_box) {
            _draw_x = global.camerax + x;
        }

        _draw_y += string_height("A") + line_sep;
    } else {
        var _dx = _draw_x;
        var _dy = _draw_y;

        if (shaking) {
            _dx += irandom_range(-1, 1);
            _dy += irandom_range(-1, 1);   
        }
        
        if (wave) {
            var wave_offset = sin((siner * 0.3) + (_char_count * 0.5)) * 2;
            _dx += cos((siner * 0.3) + (_char_count * 0.5)) * 3;
            _dy += wave_offset;
        }
        
        draw_text_transformed(_dx, _dy, _char, 1, 1, 0);
        
        _draw_x += string_width(_char);
    }

    _char_count += 1;
    _i += 1;
}

if (delayed && !skip_key) {
    delay_timer += 1;
    if (delay_timer >= delay_time) {
        delayed = false;
    }
} else {
    delayed = false;
}

var total_visible_chars = 0;
_i = 1;
while (_i <= string_length(_text)) {
    var _char = string_char_at(_text, _i);
    if (_char == "^") {
        _i += 2;
        continue;
    }
    total_visible_chars += 1;
    _i += 1;
}

if (!delayed && draw_char < total_visible_chars && !paused) {
    if (sound_char_played) {
        if (snd_count < snd_delay) {
            snd_count++;
        } else {
            snd_count = 0;
            if (array_length(random_snd) == 0) {
                audio_play_sound(snd, 0, false);
            } else {
                audio_play_sound(random_snd[irandom_range(0, array_length(random_snd) - 1)], 0, false);
            }
        }
    }

    if (skip_key && can_skip) {
        draw_char = total_visible_chars;
    } else {
        draw_char += text_speed;
    }
}

if (draw_char >= total_visible_chars && !delayed) {
    done = true;
    if (accept_key && can_accept) {
        if (page + 1 == _pages) {
            global.msg = [];
            global.can_move = true;
            instance_destroy();
        } else {
            done = false;
            draw_char = 0;
            page += 1;
        }
    }
}

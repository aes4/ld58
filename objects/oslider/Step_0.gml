mx = mouse_x
my = mouse_y

bx1 = x - w/2
bx2 = x + w/2
by1 = y - h/2 - 8
by2 = y + h/2 + 8

if (mouse_check_button_pressed(mb_left)) {
    if (mx >= bx1 && mx <= bx2 && my >= by1 && my <= by2) {
        drag = true
    }
}
if (drag) {
    t = clamp((mx - bx1) / w, 0, 1)
    value = t
    op.vol = value
    audio_master_gain(op.vol)
    if (is_undefined(op.a) == false) {
        if (!audio_is_playing(op.a)) op.a = audio_play_sound(basic1, 0, true)
        audio_sound_gain(op.a, op.vol, 0)
    }
    if (mouse_check_button_released(mb_left)) drag = false
}

if instance_exists(oplayer) {
    x = oplayer.x
    y = oplayer.y
}
where = mouse_check_button(mb_left) ? 1 : 0
spd = 1/40
if prog < where {
    prog += spd
    if (prog > where) prog = where
} else if prog > where {
    prog -=spd
    if (prog < where) prog = where
}
sprh = max(1, sprite_get_height(sprite_index))
show_debug_message("prog")
show_debug_message(string(prog))
show_debug_message("sprh")
show_debug_message(string(sprh))
idk = sprh * prog
if prog <= 0 && where == 0 {
    instance_destroy()
}
if i == 80 {
    if ii <= 10 {
        sprite_index = sbeam
    } else {
        sprite_index = sbeam2
    }
    ii = irandom_range(1, 20)
}
i = irandom_range(1, 80)
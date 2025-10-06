for (i = 0; i < 5; i += 1) {
    sx = 100 + (130 * i)
    sy = 100
    draw_sprite(sinv, 0, sx, sy)
    if (op.inv[i] != noone) {
        temp = instance_create_layer(x, y, "Instances", op.inv[i])
        spr = op.inv[i].sprite_index
        instance_destroy(temp)
        draw_sprite(spr, 0, sx, sy)
    }
}
draw_set_font(fn)
draw_text(100, 300, "Money: " + string(op.money))
draw_text(100, 400, "Sales: " + string(op.salescount))


if (op.winshow) {
    draw_set_font(fn2)
    draw_set_color(c_white)
    draw_text(room_width/2 - 220, room_height/2 - 24, "Thanks for Playing")
    draw_text(room_width/2 - 360, room_height/2 + 36, "You can keep going or rate the game")
    draw_set_color(c_white)
	draw_set_font(fn)
}
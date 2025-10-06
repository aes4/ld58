if (!instance_exists(oplayer)) { instance_destroy(); exit }
if (state == 0) {
    ang = point_direction(x, y, oplayer.x, oplayer.y)
    x += lengthdir_x(spd, ang)
    y += lengthdir_y(spd, ang)
    if (point_distance(x, y, oplayer.x, oplayer.y) <= 12) {
        for (i = 0; i < 5; i += 1) {
            if (op.inv[i] == noone) {
                op.inv[i] = item
                slot = i
                break
            }
        }
        if (slot == -1) { instance_destroy(); exit } // no room
		audio_play_sound(ohcool, 0, false)
        tx = 100
        ty = 100 + (100 * slot)
        state = 1
    }
} else {
    ang = point_direction(x, y, tx, ty)
    x += lengthdir_x(spd, ang)
    y += lengthdir_y(spd, ang)
    if (point_distance(x, y, tx, ty) <= 6) {
        instance_destroy()
    }
}
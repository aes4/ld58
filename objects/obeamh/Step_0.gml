if instance_exists(obeam) {
    x += lengthdir_x(12, point_direction(x, y, mouse_x, mouse_y))
    y += vy
    if (!instance_exists(obeam)) { instance_destroy() } // potential bug
    ox = oplayer.x
    oy = oplayer.y
    ang = point_direction(ox, oy, mouse_x, mouse_y)
    len = sprite_get_height(obeam.sprite_index) * obeam.prog
    x = ox + lengthdir_x(max(0, len - 8), ang)
    y = oy + lengthdir_y(max(0, len - 8), ang)
    for (ii = 0; ii < 5; ii += 1) {
		ih = instance_place(x, y, loc[ii])
        if (place_meeting(x, y, loc[ii])) {
            if (op.roomcount >= 1 && op.roomcount <= 5) {
                pick = op.items[op.roomcount - 1]
            } else {
                pick = op.items[irandom_range(0, 4)]
            }
            inst = instance_create_layer(x, y, "Instances", ofly)
            inst.item = pick
            temp = instance_create_layer(x, y, "Instances", pick)
            inst.sprite_index = pick.sprite_index
            instance_destroy(temp)
			with (ih) instance_destroy()
            instance_destroy()
            break
        }
    }
} else { instance_destroy() }
i -= 1
if (i <= 0) { instance_destroy() }
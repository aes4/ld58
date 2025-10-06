items = [ostick, orock, oant, ocoin, ojar]
loc = [otree2, orocks, obush, omono, ohole]
i = 60
s = 12
if instance_exists(oplayer) {
    x = oplayer.x
    y = oplayer.y
} else { instance_destroy(self) }
dir = point_direction(x, y, mouse_x, mouse_y)
vx = lengthdir_x(s, dir)
vy = lengthdir_y(s, dir)
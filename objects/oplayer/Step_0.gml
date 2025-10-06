// device_mouse_x_to_gui(0)?
show_debug_message(string(vx))
show_debug_message(string(vy))
dir = point_direction(x, y, mouse_x, mouse_y);
kw = keyboard_check(ord("W"))
ka = keyboard_check(ord("A"))
kd = keyboard_check(ord("D"))
ks = keyboard_check_pressed(vk_space)

function dirtovec(i){
    return [dcos(i), -dsin(i)]
}
vlen = point_distance(0, 0, vx, vy)
vdir = (vlen > 0.0001) ? point_direction(0, 0, vx, vy) : dir
dt = angle_difference(pdir, dir)

var ax = 0, ay = 0;
if (kw){
    f = dirtovec(dir)
    capscale = 1
    if (vlen > ssc){
        over = clamp((vlen - ssc) / max(1, ssc), 0, 1)
        capscale = max(0, 1 - over * cpush)
    }
    ax += f[0] * movea * capscale
    ay += f[1] * movea * capscale
}
if (ka || kd){
    side = (kd ? 1 : 0) - (ka ? 1 : 0)
    if (side !=0){
        sidedir = dir + side * 90
        s = dirtovec(sidedir)
        turnmatch = ((dt > 0 && side < 0) || (dt < 0 && side > 0))
        b = turnmatch ? airturn : 1
        capscales = 1
        if (vlen > ssc){
            over2 = clamp((vlen - ssc) / max(1, ssc), 0, 1)
            capscales = max(0, 1 - over2 * cpush)
        }
        ax += s[0] * sidea * b * capscales
        ay += s[1] * sidea * b * capscales
    }
}
vx += ax
vy += ay
if (!kw){
    fr = max(0, 1 - friction)
    vx *= fr
    vy *= fr
}
spd = point_distance(0, 0, vx, vy)
if (spd > hsc){
    k = hsc / spd
    vx *= k
    vy *= k
}

x += vx
y += vy

if (!ihopping){
    if (ks && canqhop){
        ihopping = true
        hopt = 0
        canqhop = false
    }
} else {
    hopt++
    framleft = hdur - hopt
    if (keyboard_check_pressed(vk_space)){
        if (framleft <= win && framleft >= 0){
            hopt = 0
        } else {
            vx *= bad
            vy *= bad
        }
    }
    if (hopt >= hdur) {
        vx *= bad
        vy *= bad
        ihopping = false
        hopt = 0
        canqhop = true
    }
}
if (!keyboard_check(vk_space) && !ihopping){
    canqhop = true
}

if (mouse_check_button_pressed(mb_left)) {
    if (!instance_exists(obeam)){
        instance_create_layer(x, y, "Instances", obeam)
    }
    if (!instance_exists(obeamh)){
        instance_create_layer(x, y, "Instances", obeamh)
    }
}
/*
if (mouse_check_button_released(mb_left)) {
    if (instance_exists(obeamh)){
        instance_destroy(obeamh)
    }
    if (instance_exists(obeam)){
        instance_destroy(obeam)
    }
}
*/
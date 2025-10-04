function rr(a, b){
    return random_range(a, b)
}

function dirtovec(i){
    return [dcos(i), -dsin(i)]
}

if (start == true){
    room_goto(one)
    roomcount += 1
    start = false
}

function neww(){
    vx = 0
    vy = 0
    pdir = dir
    dir = point_direction(px, py, mouse_x, mouse_y)
    if (keyboard_check(ord("W"))) {
        i = dirtovec(dir)
        vx += i[0] * movevel
        vy += i[1] * movevel
    }
    kd = keyboard_check(ord("D"))
    ka = keyboard_check(ord("A"))
    side = (kd ? 1 : 0) - (ka ? 1 : 0) //+1-1
    if (side != 0) {
        sidedir = dir + side * 90
        s = dirtovec(sidedir)
        vx += s[0] * sidevel
        vy += s[1] * sidevel
    }
    ex += vx
    ey += vy
    if (!keyboard_check(ord("W"))) {
        fr = max(0, 1.0 - friction)
        ex *= fr
        ey *= fr
    }
    spd = point_distance(0, 0, ex, ey)
    if (spd > cap) {
        k = cap / spd
        ex *= k
        ey *= k
    }
    px += ex
    py += ey
    if instance_exists(oplayer){
        oplayer.x = px
        oplayer.y = py
        oplayer.image_angle = dir + 90
    }
}

neww()

function topdown(){
    switch(keyboard_key){
        case ord("W"):
            if (vel < velcap) {
                vel += velstart
                vel *= velinc
            }
            py -= vel
            dir = 0
        break
        case ord("S"):
            if (vel < velcap) {
                vel += velstart
                vel *= velinc
            }
            py += vel
            dir = 2
        break
        case ord("A"):
            if (vel < velcap) {
                vel += velstart
                vel *= velinc
            }
            px -= vel
            dir = 3
        break
        case ord("D"):
            if (vel < velcap) {
                vel += velstart
                vel *= velinc
            }
            px += vel
            dir = 1
        break
    }
    if instance_exists(oplayer){
        oplayer.x = px
        oplayer.y = py
    }
}
//topdown()
/*
switch(dir){ // remove when angle dir
    case 0:
        if (py < 0){
            py += room_height
            room_goto(two) //todo function to swap between two rooms
            roomcount += 1
        }
    break
    case 1:
        if (px > room_width){
            px -= room_width
            room_goto(two) //todo function to swap between two rooms
            roomcount += 1
        }
    break
    case 2:
        if (py > room_height){
            py -= room_height
            room_goto(two) //todo function to swap between two rooms
            roomcount += 1
        }
    break
    case 3:
        if (px < 0){
            px += room_width
            room_goto(two) //todo function to swap between two rooms
            roomcount += 1
        }
    break
}
*/


switch(roomcount){
    case 1:  // fireroom
    break
    case 2:  // first room
    break
    default:  // gen room
    break
}

if (keyboard_check(ord("Z"))){
    game_end()
}
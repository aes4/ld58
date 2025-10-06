show_debug_message(instance_exists(obeamh))
// for testing
if (keyboard_check_pressed(ord("V"))) {
    for (i = 0; i < 5; i += 1) {
        op.inv[i] = op.items[i]
    }
}

function rr(a, b){
    return random_range(a, b)
}

function dirtovec(i){
    return [dcos(i), -dsin(i)]
}

if (!audio_is_playing(a)) {
    a = audio_play_sound(basic1, 0, true)
    audio_sound_gain(a, vol, 0)
}

if (start == true){
    room_goto(one)
    roomcount += 1
    start = false
    if (!audio_is_playing(a)) {
        a = audio_play_sound(basic1, 0, true)
        audio_sound_gain(a, vol, 0)
    }
}


if instance_exists(oplayer) {
    if (oplayer.y < 0) { // going up
        oplayer.y += room_height - 80
        if room == two {
            room_goto(one)
        } else {
            room_goto(two)
        }
        roomcount += 1
    }
    if (oplayer.x > rw) { // right
        oplayer.x -= rw - 80
        if room == two {
            room_goto(one)
        } else {
            room_goto(two)
        }
        roomcount += 1
    }
    if (oplayer.y > rh) { // down
        oplayer.y -= rh - 80
        if room == two {
            room_goto(one)
        } else {
            room_goto(two)
        }
        roomcount += 1
    }
    if (oplayer.x < 0) { // left
        oplayer.x += rw - 80
        if room == two {
            room_goto(one)
        } else {
            room_goto(two)
        }
        roomcount += 1
    }
}
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

if (!sellready) {
    selltimer += 1
    if (selltimer >= room_speed * 5) {
        instance_create_layer(room_width - 100, 100, "Instances", osell)
        sellready = true
    }
}


if (roomcount > 0) {
    playtime += 1
}

if (!win) {
    if (playtime >= room_speed * 120 && salescount >= 3) {
        win = true
        winshow = true
        wintimer = room_speed * 15
    }
}

if (winshow) {
    wintimer -= 1
    if (wintimer <= 0) {
        winshow = false
    }
}


if (keyboard_check(ord("Z"))){
    game_end()
}
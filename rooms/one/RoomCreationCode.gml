rw = room_width
rh = room_height
function rr(a, b){
    return random_range(a, b)
}
switch(op.roomcount){
    case 1:  // fireroom
    instance_create_layer(rr(0, rw), rr(0, rh), "Instances", ofire)
    break
    case 2:  // first room
    break
    default:  // gen room
    break
}
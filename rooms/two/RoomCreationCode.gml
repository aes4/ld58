rw = room_width
rh = room_height
loc = [otree, orocks, obush, omono, ohole]
i = irandom_range(0, 4)
function rr(a, b){
    return random_range(a, b)
}
for (w=0; w<4;w++){
    for (ii=1;ii<5;ii++){
        if instance_exists(loc[ii]) {
            instance_destroy(loc[ii])
        }
    }
}
switch(op.roomcount){
    case 2:  // first room
    break
    default:  // gen room
        n = irandom_range(5, 7)
        for (k = 0; k < n; k += 1) {
            idx = irandom_range(0, 4)
            instance_create_layer(rr(100, rw-100), rr(100, rh-100), "Instances", loc[idx])
        }
    break
}
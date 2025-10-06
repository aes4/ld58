rw = room_width
rh = room_height
loc = [otree, orocks, obush, omono, ohole]
i = irandom_range(0, 4)
function rr(a, b){
    return random_range(a, b)
}
for (w=0; w < 4; w++){
    for (k=1; k < 5;k++){
        if instance_exists(loc[k]) {
            instance_destroy(loc[k])
        }
    }
}
switch (op.roomcount) {
    case 1:
        for (i = 0; i < 20; i += 1) {
            instance_create_layer(rr(100, rw-100), rr(100, rh-100), "Instances", ofire)
        }
    break
    default:
        n = irandom_range(5, 7)
        for (k = 0; k < n; k += 1) {
            idx = irandom_range(0, 4)
            instance_create_layer(rr(100, rw-100), rr(100, rh-100), "Instances", loc[idx])
        }
    break
}
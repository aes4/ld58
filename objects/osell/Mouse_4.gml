v1 = power(op.salescount, 2) + (op.salescount + irandom_range(0, 6))
full = true
for (i = 0; i < 5; i += 1) {
    if (op.inv[i] == noone) { full = false; break }
}
sumv = 0
for (i = 0; i < 5; i += 1) {
    if (op.inv[i] != noone) {
        sumv += (op.invval[i] + v1)
    }
}
if (full) { sumv *= 2 }
if (sumv != 0) {
	audio_play_sound(ohcool, 0, false)
    op.money += sumv
    for (i = 0; i < 5; i += 1) {
        op.inv[i] = noone
        op.invval[i] = 0
    }
    op.salescount += 1
}
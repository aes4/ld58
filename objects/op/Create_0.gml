randomize() // test
//idk
rw = room_width
rh = room_height
vol = 3/4
a = audio_play_sound(basic1, 0, true)
audio_sound_gain(a, vol, 0)

roomcount = 0

inv = [noone, noone, noone, noone, noone,]
invval = [0, 0, 0, 0, 0]
items = [ostick, orock, oant, ocoin, ojar]

money = 0
salescount = 0
sellready = false
selltimer = 0

playtime = 0
win = false
winshow = false
wintimer = 0

start = false
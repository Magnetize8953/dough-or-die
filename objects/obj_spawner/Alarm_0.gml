spawnx = irandom_range(0, room_width)

spawny = -50

instance_create_layer(spawnx, spawny, "Instances", objectType)

alarm[0] = spawnInterval
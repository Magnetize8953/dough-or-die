// Attribution: Corvo, https://www.youtube.com/channel/UCZvLFOWD6r7Cj11Rrp9Rpzg
// [Tutorial - Parte 1] Networking no GameMaker✨, https://youtu.be/tA3_2_aQTtM
// [Tutorial - Parte 2] Networking no GameMaker✨, https://youtu.be/-jxIrGDo61k
// actually showcased and explained networking in GameMaker

event_inherited();

buffer = buffer_create(16384, buffer_grow, 1);
// associates player ids with objects
elements = ds_map_create();
id_on_server = -1;

server_rooms = ds_map_create();

// TODO: Handle better
decoy_rooms = ds_list_create();

client_invis = false;
client_can_spawn_decoy = false;
client_has_cutter = false;
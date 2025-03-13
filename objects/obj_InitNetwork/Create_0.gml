// Attribution: Corvo, https://www.youtube.com/channel/UCZvLFOWD6r7Cj11Rrp9Rpzg
// [Tutorial - Parte 1] Networking no GameMaker✨, https://youtu.be/tA3_2_aQTtM
// [Tutorial - Parte 2] Networking no GameMaker✨, https://youtu.be/-jxIrGDo61k
// actually showcased and explained networking in GameMaker

// packet identifiers
enum NETWORK {
    ADD_ELEMENT,
    DELETE_ELEMENT,
    MOVEMENT,
}

show_debug_message("networking initialised");
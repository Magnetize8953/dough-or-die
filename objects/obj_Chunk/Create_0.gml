self.persistent = true

// preset is used by server clients to set chunks to whatever the host has
if (!variable_instance_exists(id, "preset")) {
    // Random choice conditional produced with ChatGPT's assistance to debug random seed not resetting properly
    // Remaining code and data structure is original work
    randomize();
    fifty_fifty = (irandom(1) == 1);
} else {
    fifty_fifty = preset;
}
function room_get_x(roomName) {
	var chunk = string_copy(roomName, 1, 2);
	
	// assign x cords based on chunk locations
	if (chunk == "TL") return 0;
    if (chunk == "TM") return 1;
    if (chunk == "TR") return 2;
    if (chunk == "ML") return 0;
    if (chunk == "C")  return 1;
    if (chunk == "MR") return 2;
    if (chunk == "BL") return 0;
    if (chunk == "BM") return 1;
    if (chunk == "BR") return 2;
}


function room_get_y(roomName) {
	var chunk = string_copy(roomName, 1, 2);
	
	// assign y cords based on chunk locations
	if (chunk == "TL") return 0;
    if (chunk == "TM") return 0;
    if (chunk == "TR") return 0;
    if (chunk == "ML") return 1;
    if (chunk == "C")  return 1;
    if (chunk == "MR") return 1;
    if (chunk == "BL") return 2;
    if (chunk == "BM") return 2;
    if (chunk == "BR") return 2;
}
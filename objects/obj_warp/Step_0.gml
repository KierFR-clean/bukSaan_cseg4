if place_meeting(x, y, obj_emilio) {
   
    var fade = instance_create_layer(0, 0, "Instances", obj_fade);
    fade.target_room = target_room;
    fade.target_x = player_x;
    fade.target_y = player_y;	
}


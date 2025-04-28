if (!variable_global_exists("game_events")) {
    global.game_events = {
        amara_diego_at_painting: false,
        kitchen_puzzle_solved: false
    };
}

if (!global.game_events.amara_diego_at_painting) {
	

    instance_create_layer(470, 160, "Characters", obj_amara);
    with(obj_amara) {
        sprite_index = spr_amara_idle_b;  
        image_speed = 0.2;  
		var org_width = sprite_get_width(spr_amara_idle_b); // Get original width of Amara's sprite
        var s_x = 200 / org_width;                         // Calculate x-scale for target width of 300
        var s_y = s_x;                                     // Match y-scale to x-scale
        image_xscale = s_x;                                // Apply scaling
        image_yscale = s_y;
    }
    
    instance_create_layer(539, 170, "Characters", obj_diego);
    with(obj_diego) {
        sprite_index = spr_diego_idle_b;  
        image_speed = 0.2;  
		var org_width = sprite_get_width(spr_diego_idle_b); // Get original width of Diego's sprite
        var s_x = 200 / org_width;                         // Calculate x-scale for target width of 300
        var s_y = s_x;                                     // Match y-scale to x-scale
        image_xscale = s_x;                                // Apply scaling
        image_yscale = s_y;
    }
    


    instance_create_layer(0, 0, "Controllers", obj_scene_controller);
    


    global.game_events.amara_diego_at_painting = true;
}

// If the kitchen puzzle is not solved, go back to kitchen
if (!global.game_events.kitchen_puzzle_solved && !global.kitchen_puzzle_solved) {
    // Create a fade transition back to the kitchen
    var fade = instance_create_layer(0, 0, "Instances", obj_fade);
    fade.target_room = rm_kitchen;
    fade.target_x = 1100;
    fade.target_y = 355;
    
    // Show a message to the player
    show_message("You need to solve the puzzle in the kitchen first!");
}
if (controllable) {
    var key_right = keyboard_check(vk_right);
    var key_left = keyboard_check(vk_left);
    var key_down = keyboard_check(vk_down);
    var key_up = keyboard_check(vk_up);
	depth = -bbox_bottom;
    
    // Simplified key collision prevention
    if ((key_right && key_left) || (key_up && key_down) ||
        (key_up && key_left) || (key_up && key_right) ||
        (key_down && key_left) || (key_down && key_right)) {
        key_right = 0;
        key_left = 0;
        key_up = 0;
        key_down = 0;
    }
    
    // Speed adjustment
    move_speed = keyboard_check(vk_shift) ? 5 : 3;
    
    var horizontal = key_right - key_left;
    var vertical = key_down - key_up;
    
    // Improved collision checking
    if (horizontal != 0) {
        var new_x = x + (horizontal * move_speed);
        if (place_free(new_x, y)) {
            x = new_x;
        }
    }
    
    if (vertical != 0) {
        var new_y = y + (vertical * move_speed);
        if (place_free(x, new_y)) {
            y = new_y;
        }
    }
    
    // Sprite and facing logic remains the same
    if (horizontal == 0 && vertical == 0) {
        sprite_index = idle_sprite[facing];
    } else {
        image_speed = 1;
        
        if (vertical > 0) {
            sprite_index = walk_sprite[0];
            facing = 0;
        } else if (vertical < 0) {
            sprite_index = walk_sprite[2];
            facing = 2;
        } else if (horizontal > 0) {
            sprite_index = walk_sprite[3];
            facing = 3;
        } else if (horizontal < 0) {
            sprite_index = walk_sprite[1];
            facing = 1;
        }
    }
} 
// Rest of the code remains the same
else {
    if (path_to_follow != -1) {
       
        
        var dir = direction;
        if (dir >= 45 && dir < 135) {
            facing = 0; 
            sprite_index = walk_sprite[0];
        } else if (dir >= 135 && dir < 225) {
            facing = 1;
            sprite_index = walk_sprite[1];
        } else if (dir >= 225 && dir < 315) {
            facing = 2;
            sprite_index = walk_sprite[2];
        } else {
            facing = 3;
            sprite_index = walk_sprite[3];
        }
        image_speed = walk_speed;
        
        if (path_position == 1) {
            path_end();
            path_to_follow = -1;
            sprite_index = idle_sprite[facing];
            image_speed = idle_speed;
            
            with(obj_scene_controller) {
                if (current_state == SceneState.EMILIO_WALKING) {
                    current_state = SceneState.DIALOGUE;
                }
            }
        }
    }
}


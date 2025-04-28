switch(current_state) {
    case SceneState.INTRO:
        
        timer++;
        if (timer >= wait_time) {
            timer = 0;
            current_state = SceneState.EMILIO_WALKING;
            
        
            with(obj_emilio) {
				var start_x = 1247;              
                var start_y = 674;
                var target_x = obj_diego.x - 60;
                var target_y = obj_amara.y + 50;
                
        
				// Create a custom path instead of using mp_grid_path
               other.path_to_follow = path_add();
                path_set_kind(other.path_to_follow, 1);      // Set to smooth path
                path_set_precision(other.path_to_follow, 8); // Increase precision for smoother curves
                    
                // New path points based on the white line in the image
				path_add_point(other.path_to_follow, 1147, 574, 100);   // initial position
               // path_add_point(other.path_to_follow, 1150, 674, 100);   // Move left
                //path_add_point(other.path_to_follow, 1050, 660, 100);   // Curve slightly
                //path_add_point(other.path_to_follow, 950, 610, 100);    // Continue curving
                path_add_point(other.path_to_follow, 800, 550, 100);    // Move up and left
                path_add_point(other.path_to_follow, 830, 380, 100);    // Continue up
                path_add_point(other.path_to_follow, 760, 330, 100);    // Move left
                path_add_point(other.path_to_follow, 680, 320, 100);    // Continue left with slight curve
                path_add_point(other.path_to_follow, 600, 335, 100);    // Curve downward slightly
                path_add_point(other.path_to_follow, target_x, target_y, 100); // End near characters
                
                // Make the path visible for debugging (can be removed later)
                path_set_closed(other.path_to_follow, false);
                
                // Set initial walking animation based on first path segment direction
                sprite_index = walk_sprite[1]; // Start with walking left
                image_speed = walk_speed; // Set animation speed
                
                // Start Emilio on the path
                path_start(other.path_to_follow, move_speed, path_action_stop, true);
            }
        }
        break;
        
	
	 case SceneState.EMILIO_WALKING:
        
        with(obj_emilio) {
            // Update animation based on current path direction
            if (path_index != -1) {
                var dx = path_get_x(path_index, path_position + 0.01) - x;
                var dy = path_get_y(path_index, path_position + 0.01) - y;
                
                // Set facing and animation based on dominant direction
                if (abs(dx) > abs(dy)) {
                    // Horizontal movement is dominant
                    if (dx > 0) {
                        sprite_index = walk_sprite[3]; // Right
                        facing = 3;
                    } else {
                        sprite_index = walk_sprite[1]; // Left
                        facing = 1;
                    }
                } else {
                    // Vertical movement is dominant
                    if (dy > 0) {
                        sprite_index = walk_sprite[0]; // Down
                        facing = 0;
                    } else {
                        sprite_index = walk_sprite[2]; // Up
                        facing = 2;
                    }
                }
                
                // Ensure the animation is playing
                image_speed = walk_speed;
            }
            
            if (path_position == 1) {
                path_end();
                sprite_index = spr_emilio_idle_b;
                image_speed = idle_speed;
                has_reached_target = true; // Flag to prevent position reset
                other.current_state = SceneState.DIALOGUE;
            }
        }
        break;
		
	case SceneState.DIALOGUE:
	
		 with(obj_emilio) {
                sprite_index = spr_emilio_idle_b;
            }
			
		 with(obj_amara) {
                sprite_index = spr_amara_idle_f;
            }
		 with(obj_diego) {
                sprite_index = spr_diego_idle_l;
            }
       
        if (dialogue_progress < string_length(ds_list_find_value(dialogue, dialogue_index))) {
            dialogue_progress += dialogue_speed;
            dialogue_text = string_copy(ds_list_find_value(dialogue, dialogue_index), 1, floor(dialogue_progress));
        }
        
	 if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
            if (dialogue_progress < string_length(ds_list_find_value(dialogue, dialogue_index))) {
            
                dialogue_progress = string_length(ds_list_find_value(dialogue, dialogue_index));
                dialogue_text = ds_list_find_value(dialogue, dialogue_index);
            } else {
               
                dialogue_index++;
                dialogue_progress = 0;
                dialogue_text = "";
             
                if (dialogue_index >= ds_list_size(dialogue)) {
                    current_state = SceneState.FADE_OUT;
                }
            }
        }
        break;
		
		case SceneState.FADE_OUT:
  
        alpha += 0.02;
        if (alpha >= 1) {
        
            obj_amara.visible = false;
            obj_diego.visible = false;
            
        
            with(obj_emilio) {
                sprite_index = spr_emilio_idle_b;
            }
            
            current_state = SceneState.FADE_IN;
        }
        break;
		
	case SceneState.FADE_IN:
     
        alpha -= 0.02;
        if (alpha <= 0) {
            alpha = 0;
            current_state = SceneState.PLAYER_CONTROL;
            
        
            with(obj_emilio) {
                controllable = true;
            }
        }
        break;
        
    case SceneState.PLAYER_CONTROL:
       //since player have control now
        break;
}

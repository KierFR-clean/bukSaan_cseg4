switch(current_state) {
    case SceneState.INTRO:
        
        timer++;
        if (timer >= wait_time) {
            timer = 0;
            current_state = SceneState.EMILIO_WALKING;
            
        
            with(obj_emilio) {
				var start_x = x;              
                var start_y = y;
                var target_x = obj_diego.x - 60;
                var target_y = obj_amara.y + 50;
                
        
				// Create a custom path instead of using mp_grid_path
               other.path_to_follow = path_add();
                path_set_kind(other.path_to_follow, 1);      
                path_set_precision(other.path_to_follow, 6); 
                
                
                path_add_point(other.path_to_follow, 1247, 674, 4);   //initial position 1250,684
               path_add_point(other.path_to_follow, 1072, 678, 4);           // Move left
               path_add_point(other.path_to_follow, 1072, 245, 4);           // move up
                path_add_point(other.path_to_follow, 863, 245, 4);           // move left
                path_add_point(other.path_to_follow, 863, 432, 4);           // move down
                path_add_point(other.path_to_follow, 569, 447, 4);           // move left
             path_add_point(other.path_to_follow, target_x, target_y, 4); // End near characters
                
                // Start Emilio on the path
              path_start(other.path_to_follow, move_speed, path_action_stop, true);
            }
        }
        break;
        
	
	 case SceneState.EMILIO_WALKING:
        
        with(obj_emilio) {
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

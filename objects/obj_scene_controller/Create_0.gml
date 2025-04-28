enum SceneState {
    INTRO,
    EMILIO_WALKING,
    DIALOGUE,
    FADE_OUT,
    FADE_IN,
    PLAYER_CONTROL
}

has_reached_target = false;

current_state = SceneState.INTRO;
timer = 0;
wait_time = 60;
alpha = 0;

grid = mp_grid_create(0, 0, room_width div 64, room_height div 64, 64, 64);

mp_grid_add_instances(grid, obj_bookshelf, true);
mp_grid_add_instances(grid, obj_sofa_west, true);


dialogue = ds_list_create();
ds_list_add(dialogue, "Diego: Ano sa tingin mo tungkol sa painting ng bagyo na ito? Medyo... kakaiba.");
ds_list_add(dialogue, "Amara: Parang may kinalaman ito sa ating tahanan katulad ng mga lumang kwento ni Lolo.");
ds_list_add(dialogue, "Diego: Oo, may kakaiba akong nararamdaman dito. Iniisip ko kung ano ang ibig sabihin ni Lolo sa 'ang sagot ay nakatago sa bagyo.'");
ds_list_add(dialogue, "Amara: Ano sa tingin mo emilio?");

dialogue_index = 0;
dialogue_progress = 0;
dialogue_speed = 0.5;
dialogue_text = "";
dialogue_width = room_width - 80;
path_to_follow = -1;

depth = -1000;

// Function to solve the kitchen puzzle
function solve_kitchen_puzzle() {
    global.game_events.kitchen_puzzle_solved = true;
    global.kitchen_puzzle_solved = true;
    show_message("Puzzle solved! You can now proceed to the hallway.");
}



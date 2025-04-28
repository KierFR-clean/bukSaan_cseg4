if (!variable_global_exists("game_events")) {
    global.game_events = {
        amara_diego_at_painting: false,
        kitchen_puzzle_solved: false
    };
}

if (!variable_global_exists("kitchen_puzzle_solved")) {
    global.kitchen_puzzle_solved = false;
} 
//set speed to 1
move_speed = 2;
//default nakaharap sa baba
facing = 0;
//since idle prone sa bug if f_idle so ifreeze ko nalang

//incase dumaan sa > height na object


//walk_spr

walk_sprite[0] = spr_emilio_walk_f;
walk_sprite[1] = spr_emilio_walk_l;
walk_sprite[2] = spr_emilio_walk_b;
walk_sprite[3] = spr_emilio_walk_r;


//idle_spr
idle_sprite[0] = spr_emilio_idle_f;
idle_sprite[1] = spr_emilio_idle_l;
idle_sprite[2] = spr_emilio_idle_b;
idle_sprite[3] = spr_emilio_idle_r;

//default sprite sa idle ung front down
sprite_index = idle_sprite[1];

// make to persist
persistent = true;

controllable = false;
path_to_follow = -1;
idle_speed = 0.2;
walk_speed = 0.3;
npc_x = 0;
npc_y = 0;


depth = -bbox_bottom;
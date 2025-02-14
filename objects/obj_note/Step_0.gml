var player = instance_nearest(x, y, hebreo_obj);
if instance_exists(player) {
    var dist = point_distance(x, y, player.x, player.y);
    
    if dist < 10 { 
        is_nearToObj = true;
		global.show_prompt = true;
        
    } else {
        is_nearToObj = false;
		global.show_prompt = false;
    }
    
}
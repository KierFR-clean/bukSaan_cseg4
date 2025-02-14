var player = instance_nearest(x, y, hebreo_obj);
if instance_exists(player) {
    var dist = point_distance(x, y, player.x, player.y);
    
    if dist < 23 { 
        is_nearObjTable = true;
		global.show_prompt = true;
        
    } else {
        is_nearObjTable = false;
		global.show_prompt = false;
    }
    
}
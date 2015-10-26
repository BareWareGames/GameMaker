/// scr_ai_human (this, enable)
var this = argument0;
var enabled = argument1;

if (!enabled) {

    // Select target
    if (this.package == noone && this.target == noone) this.target = instance_nearest (this.x, this.y, obj_package);
    else if (instance_exists (this.target) && object_get_name (this.target.object_index) == "obj_package" && this.target.target != noone) this.target = this.target.target;
    else if (instance_exists(global.player)) this.target = global.player;
    else if (this.package != noone) this.target = noone;
    else this.target = noone;

    // Choose key
    /*
        Commands :
            -   Follow
            -   Attack
            -   Protect
            -   Acquire
            -   Wander
            -   Sneak
            -   Idle
    */
    
    // Helper of wander and idle
    if (this.target == noone && intel_distance <= 0) {
        intel_distance = room_speed * max(2, irandom(4));
        intel_dir = choose(0, 1, 2);
    } else if (this.x - 10 < 0 || this.x + 10 > room_width) { intel_distance = 0;
    } else if (intel_distance > 0) intel_distance--;
    
    // Now decide what the AI will do
    
    if (this.target != noone && instance_exists(this.target)) {
    
        // Sneak
        this.key_down = (this.target.target != this); 
        
        // Protect
        if (this.target.team == this.team && this.target.target != noone) this.target = this.target.target;
        
        // Attack
        if (this.target.team != this.team) this.key_modify = abs (this.target.x - this.x) <= 5 && object_get_name (this.target.object_index) == "obj_human";
        
        // Jump
        this.key_space = (abs (this.target.y - this.y) > 10);
        
        // Follow
        this.key_left = (sign (this.target.x - this.x) == -1 && abs (this.target.x - this.x) > 5);
        this.key_right = (sign (this.target.x - this.x) == 1 && abs (this.target.x - this.x) > 5);
        
        // Acquire
        if (object_get_name (this.target.object_index) == "obj_package") this.key_interact = this.package == noone && physics_test_overlap (this.x, this.y, 0, obj_package) ||
                            this.package != noone && this.phy_speed_x < this.spd/2;
    } else {
        // Wander
        this.key_right = (intel_dir == 0);
        this.key_left = (intel_dir == 1);
    }
    
}

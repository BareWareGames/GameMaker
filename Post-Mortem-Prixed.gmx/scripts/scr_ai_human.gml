/// scr_ai_human (this, enable)
var this = argument0;
var enabled = argument1;

if (!enabled) {

    // Select target
    if (this.package == noone && this.target == noone) this.target = instance_nearest (this.x, this.y, obj_package);
    else if (instance_exists (this.target) && object_get_name (this.target.object_index) == "obj_package" && this.target.target != noone) this.target = this.target.target;

    // Choose key
    if (instance_exists (this.target)) {
        this.key_modify = abs (target.x - this.x) <= 5 && object_get_name (this.target.object_index) == "obj_human";
        this.key_space = (abs (target.y - this.y) > 10);
        this.key_left = (sign (target.x - this.x) == -1 && abs (target.x - this.x) > 5);
        this.key_right = (sign (target.x - this.x) == 1 && abs (target.x - this.x) > 5);
        this.key_interact = this.package == noone && physics_test_overlap (this.x, this.y, 0, obj_package) ||
                            this.package != noone && this.phy_speed_x < spd/2;
    }
}

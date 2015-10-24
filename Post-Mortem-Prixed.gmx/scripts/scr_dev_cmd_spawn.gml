/// scr_dev_cmd_spawn (type, amount, enabled)
var type = noone;

switch (argument0) {
case "human":
type = obj_human;
break;
}

repeat(argument1) {
    var inst = instance_create (50, 50, type);
    inst.enabled = real(argument2);
}

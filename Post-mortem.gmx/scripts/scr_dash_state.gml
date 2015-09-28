///scr_dash_state

//Get the axis
//Once controller is fixed this can go!
xaxis = (right_key - left_key);
yaxis = (down_key - up_key);

//Set length
len = spd * 4; // Dash will move 4 times as fast

//Get hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

//Move
phy_position_x += hspd;
phy_position_y += vspd;

//Create dash effect
var dash = instance_create(x, y, obj_dash_effect);
dash.sprite_index = sprite_index;
dash.image_index = image_index;

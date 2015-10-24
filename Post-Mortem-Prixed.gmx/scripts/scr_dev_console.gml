/// scr_dev_console ()
draw_text(30, 30, keyboard_string);

if (key_enter) {
    command = keyboard_string;
    keyboard_string = "";
}

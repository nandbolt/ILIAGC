// Info
maxPlayers = 4;
inputStates = 0;
inputKeyboardKeys = 0;
inputGamepadKeys = 0;
inputTouchKeys = 0;
gamepadCount = 0;

// Control methods
playerGamepadIds = ds_list_create();
ds_list_add(playerGamepadIds, -1);

// Create initial inputs
inputCreate(InputAction.LEFT, ord("A"), gp_padl, [0, 208, 32, 304]);
inputCreate(InputAction.RIGHT, ord("D"), gp_padr, [48, 208, 80, 304]);
inputCreate(InputAction.UP, ord("W"), gp_padu, [0, 208, 80, 240]);
inputCreate(InputAction.DOWN, ord("S"), gp_padd, [0, 272, 80, 304]);
inputCreate(InputAction.JUMP, vk_space, gp_face1, [96, 272, 176, 304]);
inputCreate(InputAction.INTERACT, vk_enter, gp_face3, [96, 240, 176 - 48, 272]);
inputCreate(InputAction.START, vk_escape, gp_start, [176 - 32, 208, 176, 240]);
inputCreate(InputAction.SELECT, vk_tab, gp_select, [96, 208, 176 - 48, 240]);
inputCreate(InputAction.MENU_LEFT, vk_left, gp_shoulderlb, [40, 208 - 48 - 80, 48 + 32, 208 - 16 - 80]);
inputCreate(InputAction.MENU_RIGHT, vk_right, gp_shoulderrb, [96, 208 - 48 - 80, 176 - 40, 208 - 16 - 80]);
inputCreate(InputAction.MENU_UP, vk_up, gp_shoulderl, [0, 208 - 48 - 80, 40, 208 - 16 - 80]);
inputCreate(InputAction.MENU_DOWN, vk_down, gp_shoulderr, [176 - 40, 208 - 48 - 80, 176, 208 - 16 - 80]);
inputCreate(InputAction.CLEAR, vk_space, gp_face2, [176 - 32, 240, 176, 272]);